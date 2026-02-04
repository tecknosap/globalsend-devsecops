# ---------------------------
# App Service Plan
# ---------------------------
# This resource defines the App Service Plan for the Linux Web App.
# The App Service Plan controls pricing tier, instance size, OS type,
# and scaling characteristics for the application.
# Uses the modern azurerm_service_plan resource (recommended).

resource "azurerm_service_plan" "globalsend_plan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location

  os_type  = "Linux"   # Specifies Linux-based App Service
  sku_name = "B1"      # Basic tier suitable for low to moderate traffic
}

# ---------------------------
# Linux Web App
# ---------------------------
# This resource deploys a Linux-based Azure Web App.
# The app is associated with the App Service Plan above
# and runs using a ZIP package deployment model.
# Baseline security hardening is applied.

resource "azurerm_linux_web_app" "globalsend_app_service" {
  name                = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = var.location

  # Links the Web App to the App Service Plan
  service_plan_id = azurerm_service_plan.globalsend_plan.id

  # Enforces HTTPS-only access to the application
  https_only = true

  # Enables a system-assigned managed identity
  # Used to avoid hard-coded secrets and credentials
  identity {
    type = "SystemAssigned"
  }

  site_config {
    # Sets the default landing page for the application
    default_documents = ["index.html"]

    # Enforces a minimum TLS version for inbound traffic
    minimum_tls_version = "1.2"
  }

  app_settings = {
    # Configures the Web App to run directly from a ZIP deployment package
    WEBSITE_RUN_FROM_PACKAGE = var.zip_blob_url
  }
}
