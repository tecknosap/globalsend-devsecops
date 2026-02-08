resource "azurerm_log_analytics_workspace" "this" {
  name                = var.log-analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# =====================================================
# Configure Diagnostic Settings for the target resource for app service
# =====================================================
resource "azurerm_monitor_diagnostic_setting" "app_service_diagnostics" {
  name                       = var.diagnostic_setting
  target_resource_id         = var.app_service_target_resource_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  enabled_log { category = "AppServiceHTTPLogs" } 
  enabled_log { category = "AppServiceConsoleLogs" } 
  enabled_log { category = "AppServiceAppLogs" } 
    metric {
    category = "AllMetrics"
    enabled  = true
  }
}


# =====================================================
# Configure Diagnostic Settings for the target resource storage account
# =====================================================
resource "azurerm_monitor_diagnostic_setting" "storage_blob_diagnostics" {
  name                       = var.diagnostic_setting
  target_resource_id         = var.storage_account_target_resource_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

    metric {
    category = "Transaction"
    enabled  = true
  }
}

