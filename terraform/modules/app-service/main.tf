# ---------------------------
# App Service Plan
# ---------------------------
# This resource defines the App Service Plan for the Linux Web App. 
# The App Service Plan determines the pricing tier, instance size, and scaling options.
resource "azurerm_app_service_plan" "globalsend_app_service_plan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    tier = "Standard"  # Tier defines the pricing and features (Free, Basic, Standard, Premium)
    size = "B1"        # Instance size; B1 is a small instance suitable for low traffic apps
  }
}

# ---------------------------
# Linux Web App
# ---------------------------
# This resource deploys a Linux-based Web App to Azure.
# The app is linked to the App Service Plan created above and runs from a zip package.
resource "azurerm_linux_web_app" "globalsend_app_service" {
  name                = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_app_service_plan.globalsend_app_service_plan.id

  site_config {
    default_documents = ["index.html"]  # Sets the default landing page for the app
  }

  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE = var.zip_blob_url  # Configures the app to run from a zip deployment package
    "APPINSIGHTS_INSTRUMENTATIONKEY" = var.app_insights_instrumentation_key
    
  }
}





