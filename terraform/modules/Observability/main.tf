# ===============================
# Log Analytics Workspace
# ===============================
resource "azurerm_log_analytics_workspace" "this" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_in_days
}

# ===============================
# Application Insights
# ===============================
resource "azurerm_application_insights" "this" {
  name                = var.application_insight_name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"

  workspace_id = azurerm_log_analytics_workspace.this.id
}

# ===============================
# App Service Diagnostics
# ===============================
resource "azurerm_monitor_diagnostic_setting" "app_service" {
  name                       = var.app_service_diagnostics_name
  target_resource_id         = var.target_app_service_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  enabled_log {
    category = "AppServiceHTTPLogs"

  }

 enabled_log {
    category = "AppServiceConsoleLogs"

  }

 enabled_log {
    category = "AppServiceAppLogs"

  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

# ===============================
# Storage Account – Blob Diagnostics
# ===============================
resource "azurerm_monitor_diagnostic_setting" "storage_blob" {
  name                       = var.storage_account_diagnostics_name
  target_resource_id         = var.target_storage_account_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  enabled_log {
    category = "StorageRead"

  }

  enabled_log {
    category = "StorageWrite"

  }

enabled_log {
    category = "StorageDelete"

  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
