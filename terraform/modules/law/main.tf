# ---------------------------
# Log Analytics Workspace
# ---------------------------
# This resource defines a Log Analytics Workspace for collecting
# and storing logs and metrics from Azure resources.

resource "azurerm_log_analytics_workspace" "this" {
  name                = var.log-analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# =====================================================
# Diagnostic Settings for App Service
# =====================================================
# This resource configures diagnostic settings for the App Service
# and sends logs and metrics to the Log Analytics Workspace.

resource "azurerm_monitor_diagnostic_setting" "app_service_diagnostics" {
  name                       = var.diagnostic_setting
  target_resource_id         = var.app_service_target_resource_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  # HTTP request and response logs
  enabled_log { category = "AppServiceHTTPLogs" }

  # Console output logs
  enabled_log { category = "AppServiceConsoleLogs" }

  # Application-level logs
  enabled_log { category = "AppServiceAppLogs" }

  # Platform metrics
  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

# =====================================================
# Diagnostic Settings for Storage Account (Blob)
# =====================================================
# This resource configures diagnostic settings for the Storage Account
# to collect and send transaction metrics to Log Analytics.

resource "azurerm_monitor_diagnostic_setting" "storage_blob_diagnostics" {
  name                       = var.diagnostic_setting
  target_resource_id         = var.storage_account_target_resource_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  # Storage transaction metrics
  metric {
    category = "Transaction"
    enabled  = true
  }
}
