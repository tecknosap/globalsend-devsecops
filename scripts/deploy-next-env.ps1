# Auto deploy dev -> staging
# Must be run from dev branch ###

set-StrictMode -Version Latest
$currentBranch = git rev-parse --abbrev-ref HEAD
Write-Host "Current branch: $currentBranch"

if ($currentBranch -ne "dev") {
    Write-Host "❌ You must be on dev branch to start deployment."
    exit 1
}

# Step 1: commit & push dev changes
$changes = git status --porcelain
if ($changes) {
    git add .
    git commit -m "Initail commit"
    Write-Host "✅ Dev changes committed."
} else {
    Write-Host "⚠️ No changes to commit."
}

git push origin dev
Write-Host "✅ Dev branch pushed. Pipeline should trigger dev deployment."

# Step 2: wait for dev deployment (manual confirmation)
$status = Read-Host "Check dev deployment in GitHub Actions. Type 'done' when finished"
while ($status -ne "done") {
    $status = Read-Host "Still waiting. Type 'done' when dev deployment is finished"
}

# Step 3: switch to staging
git checkout staging
git merge dev
git push origin staging
Write-Host "✅ Staging branch updated and pushed. Staging deployment should start."
