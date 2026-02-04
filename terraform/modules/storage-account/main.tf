# ---------------------------
# Storage Account
# ---------------------------
# Defines an Azure Storage Account for storing the app deployment package.
resource "azurerm_storage_account" "global_sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_replication_type = "LRS"
  account_tier             = "Standard"
  min_tls_version          = "TLS1_2"

  #enable_https_traffic_only        = true
  public_network_access_enabled    = false
  shared_access_key_enabled        = true
  infrastructure_encryption_enabled = true

  # identity {
  #   type = "SystemAssigned"
  # }

  # network_rules {
  #   default_action = "Deny"
  #   bypass         = ["AzureServices"]
  # }

  blob_properties {
    delete_retention_policy {
      days = 7
    }

    container_delete_retention_policy {
      days = 7
    }
  }
}


# ---------------------------
# Storage Container
# ---------------------------
# Creates a container inside the Storage Account to hold blobs.
resource "azurerm_storage_container" "global_container" {
  name                   = var.storage_container_name
  storage_account_id = azurerm_storage_account.global_sa.id
  container_access_type  = "private"  # Public access for testing; consider 'private' for production
}

# ---------------------------
# Archive the App Directory
# ---------------------------
# Packages the local application directory into a ZIP file for deployment.
data "archive_file" "zip_index" {
  type        = "zip"
  source_dir  = "${path.module}/../../../app"  # Local app folder
  output_path = "${path.module}/index.zip"    # ZIP file output
}

# ---------------------------
# Upload Blob to Storage
# ---------------------------
# Uploads the ZIP package to the Storage Container.
resource "azurerm_storage_blob" "global_container_blob" {
  name                   = var.storage_blob_name
  storage_account_name   = azurerm_storage_account.global_sa.name
  storage_container_name = azurerm_storage_container.global_container.name
  type                   = "Block"                         # Block blob type for file storage
  source                 = data.archive_file.zip_index.output_path
}


