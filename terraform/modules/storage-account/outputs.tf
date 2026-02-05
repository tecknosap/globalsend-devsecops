# URL of the uploaded ZIP package
output "zip_blob_url" {
  value = azurerm_storage_blob.global_container_blob.url
}
output "storage_account_id" {
  description = "The resource ID of the Storage Account."
  value       = azurerm_storage_account.global_sa.id
}