<#
.SYNOPSIS
Fully automated Dev -> Staging -> Prod deployment with Blue-Green swap.
Author: GlobalSend DevOps
#>

Set-StrictMode -Version Latest

# --------------------------
# Step 0: Check Current Branch
# --------------------------
$currentBranch = git rev-parse --abbrev-ref HEAD
Write-Host "Current branch: $currentBranch"

if ($currentBranch -ne "dev") {
    Write-Host " You must be on 'dev' branch to start deployment."
    exit 1
}

# --------------------------
# Step 1: Commit & Push Dev Changes
# --------------------------
$changes = git status --porcelain
if ($changes) {
    git add .
    git commit -m " Auto-deploy Dev changes"
    Write-Host " Dev changes committed."
} else {
    Write-Host " No changes to commit."
}

git push origin dev
Write-Host " Dev branch pushed. Dev pipeline triggered."

# --------------------------
# Step 2: Merge Dev -> Staging
# --------------------------
Write-Host "🔄 Switching to staging branch..."
git checkout staging
git pull origin staging

git merge --no-ff dev -m " Merge Dev into Staging for deployment"
git push origin staging
Write-Host "✅ Staging branch updated. Staging pipeline triggered."

# --------------------------
# Step 3: Deploy to Inactive Prod Slot (Guarded)
# --------------------------
$resourceGroup = "globalsend-prod-rg"
$webAppName    = "globalsend-prod-webapp"
$inactiveSlot  = "prod-inactive"
$activeSlot    = "production"

Write-Host " Preparing to deploy to inactive prod slot: $inactiveSlot"

# Ensure Az context exists
try {
    $ctx = Get-AzContext -ErrorAction Stop
} catch {
    Write-Host " No Azure context found. Run Connect-AzAccount first. Skipping prod deployment."
    exit 0
}

# Ensure resource group exists
$rg = Get-AzResourceGroup -Name $resourceGroup -ErrorAction SilentlyContinue
if (-not $rg) {
    Write-Host " Resource group '$resourceGroup' not found. Skipping prod deployment."
    exit 0
}

Write-Host "🚀 Deploying latest build to inactive slot: $inactiveSlot"

az webapp deployment source config-zip `
    --resource-group $resourceGroup `
    --name $webAppName `
    --slot $inactiveSlot `
    --src "./build/globalsend.zip"

# --------------------------
# Step 4: Smoke Test
# --------------------------
Write-Host "⏳ Running smoke test on inactive slot..."

$smokeUrl = "https://$($webAppName)-$inactiveSlot.azurewebsites.net"
try {
    $response = Invoke-WebRequest -Uri $smokeUrl -UseBasicParsing -ErrorAction Stop
} catch {
    Write-Host " Smoke test failed hitting $smokeUrl"
    Write-Host "   Error: $($_.Exception.Message)"
    Write-Host "Aborting deployment before swap."
    exit 1
}

if ($response.StatusCode -ne 200) {
    Write-Host " Smoke test returned status code $($response.StatusCode). Aborting deployment."
    exit 1
} else {
    Write-Host "✅ Smoke test passed."
}

# --------------------------
# Step 5: Blue-Green Slot Swap
# --------------------------
Write-Host "🔄 Swapping inactive slot with production slot..."

try {
    Swap-AzWebAppSlot -ResourceGroupName $resourceGroup `
        -Name $webAppName `
        -SourceSlotName $inactiveSlot `
        -DestinationSlotName $activeSlot

    Write-Host " Blue-Green swap completed. Production now live!"
} catch {
    Write-Host " Slot swap failed: $($_.Exception.Message)"
    exit 1
}