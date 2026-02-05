
# ---------------------------
# Output Web App URL
# ---------------------------
# Outputs the fully qualified domain name of the deployed web app.
# Useful for referencing the app URL in other resources or modules.
output "webapp_url" {
  value       = "https://${azurerm_linux_web_app.globalsend_app_service.default_hostname}"
  description = "The URL of the deployed Web App"
}
output "app_service_id" {
  description = "The resource ID of the App Service."
  value       = azurerm_linux_web_app.globalsend_app_service.id
}
