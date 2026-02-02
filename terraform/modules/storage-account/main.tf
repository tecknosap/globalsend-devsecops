resource "azurerm_storage_account" "global_sa" {
  name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.location
  account_replication_type = "LRS"
  account_tier = "Standard"

}

resource "azurerm_storage_container" "global_container" {
  name = var.storage_container_name
  storage_account_name = azurerm_storage_account.global_sa.name
   container_access_type = "blob"   # public for testing
  
}

data "archive_file" "zip_index" {
  type        = "zip"
  source_dir  = "${path.module}/../../../app"
  output_path = "${path.module}/index.zip"
}

resource "azurerm_storage_blob" "global_container_blob" {
  name = var.storage_blob_name
  storage_account_name = azurerm_storage_account.global_sa.name
  storage_container_name = azurerm_storage_container.global_container.name
  type                   = "Block"
  source                = data.archive_file.zip_index.output_path
}

