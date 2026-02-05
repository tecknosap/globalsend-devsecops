# URL of the uploaded ZIP package
output "zip_blob_url" {
  value = azurerm_storage_blob.global_container_blob.url
}
