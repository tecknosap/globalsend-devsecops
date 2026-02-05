# =====================================================
# Output the instrumentation key and app_id
# =====================================================
output "instrumentation_key" {
  value = azurerm_application_insights.this.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.this.app_id
}