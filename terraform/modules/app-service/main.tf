
resource "azurerm_app_service_plan" "globalsend_app_service_plan" {
  name = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location = var.location
    sku {
    tier = "Standard"
    size = "B1"
  }
  
}


resource "azurerm_linux_web_app" "globalsend_app_service" {
  name                = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_app_service_plan.globalsend_app_service_plan.id

  site_config {
    default_documents = ["index.html"]
  }

  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE = var.zip_blob_url
  }

}

# ---------------------------
# Output Web App URL
# ---------------------------
output "webapp_url" {
  value       = "https://${azurerm_linux_web_app.globalsend_app_service.default_hostname}"
  description = "The URL of the deployed Web App"
}
