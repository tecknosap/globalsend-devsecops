resource "azurerm_resource_group" "globalsend_main_rg" {
  name = var.resource_group_name
  location = var.location
  
}

module "storage-account" {
    source = "./modules/storage-account"
      resource_group_name = azurerm_resource_group.globalsend_main_rg.name
      location = azurerm_resource_group.globalsend_main_rg.location

}

module "app-service" {
  source = "./modules/app-service"
  resource_group_name = azurerm_resource_group.globalsend_main_rg.name
  location = azurerm_resource_group.globalsend_main_rg.location
  zip_blob_url = module.storage-account.zip_blob_url

}

