# ---------------------------
# Storage Account
# ---------------------------
# Defines an Azure Storage Account for storing the app deployment package.
resource "azurerm_storage_account" "global_sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_replication_type = "LRS"       # Locally redundant storage
  account_tier             = "Standard"  # Standard performance tier
}

# ---------------------------
# Storage Container
# ---------------------------
# Creates a container inside the Storage Account to hold blobs.
resource "azurerm_storage_container" "global_container" {
  name                   = var.storage_container_name
  storage_account_name   = azurerm_storage_account.global_sa.name
  container_access_type  = "blob"  # Public access for testing; consider 'private' for production
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
