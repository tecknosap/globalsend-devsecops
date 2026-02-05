# ---------------------------
# Random Suffix Generator
# ---------------------------
# Generates a random integer (1–9) to append to resource names, ensuring uniqueness.
resource "random_integer" "suffix" {
  min = 1
  max = 9
}

# ---------------------------
# Azure Client Info
# ---------------------------
# Fetches details about the current authenticated Azure client.
# Useful for subscription ID, tenant ID, and object ID references.
data "azurerm_client_config" "current" {}

# ---------------------------
# Resource Group
# ---------------------------
# Creates the main resource group for GlobalSend with a unique suffix and environment identifier.
resource "azurerm_resource_group" "globalsend_main_rg" {
  name     = "globalsend-${var.environment}-rg-${random_integer.suffix.result}"
  location = var.location
}

# ---------------------------
# Storage Account Module
# ---------------------------
# Deploys a storage account via a reusable module.
# The account name is lowercase and unique, combining prefix, environment, and random suffix.
module "storage-account" {
  source              = "./modules/storage-account"
  resource_group_name = azurerm_resource_group.globalsend_main_rg.name
  location            = var.location
  storage_account_name = lower("${var.storage_account_name}${var.environment}${random_integer.suffix.result}")
  depends_on = [ azurerm_resource_group.globalsend_main_rg ]
}


module "app-service" {
  source              = "./modules/app-service"
  resource_group_name = azurerm_resource_group.globalsend_main_rg.name
  location            = var.location
  app_service_plan_name = "${var.app_service_plan_name}-${var.environment}-${random_integer.suffix.result}"
  app_service_name      = "${var.app_service_name}-${var.environment}-${random_integer.suffix.result}"
  zip_blob_url       = module.storage-account.zip_blob_url
  app_insights_connection_string = module.app-insights.connection_string
  app_insights_instrumentation_key = module.app-insights.instrumentation_key
  depends_on = [ azurerm_resource_group.globalsend_main_rg, module.storage-account, module.app-insights ]
  
}

module "law" {
  source              = "./modules/log-analytics"
  resource_group_name = azurerm_resource_group.globalsend_main_rg.name
  location            = var.location
  depends_on = [ azurerm_resource_group.globalsend_main_rg ]
  
}

module "app-insights" {
  source              = "./modules/app-insights"
  resource_group_name = azurerm_resource_group.globalsend_main_rg.name
  location            = var.location
  workspace_id        = module.law.workspace_id
  depends_on = [ azurerm_resource_group.globalsend_main_rg, module.law ]
  
}

# # ---------------------------
# # Observability Module
# # ---------------------------
# # Deploys monitoring for the App Service and Storage Account via a reusable module.
# # This includes Log Analytics Workspace, Application Insights, and diagnostic settings.
# module "Observability" {
#   source = "./modules/Observability"
#   resource_group_name = azurerm_resource_group.globalsend_main_rg.name
#   location            = var.location
#   target_app_service_id = module.app-service.app_service_id
#   target_storage_account_id = module.storage-account.storage_account_id
#   depends_on = [ module.app-service,module.storage-account ]

# }

# module "app-insights" {
#   source              = "./modules/app-insights"
#   resource_group_name = azurerm_resource_group.globalsend_main_rg.name
#   location            = var.location
#   workspace_id        = module.Observability.log_analytics_workspace_id
# }


