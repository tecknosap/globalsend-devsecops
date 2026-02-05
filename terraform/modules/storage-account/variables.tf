# Name of the resource group for deployment
variable "resource_group_name" {
  description = "Name of the resource group for the GlobalSend App Service."
  type        = string
}

# Azure region where resources will be deployed
variable "location" {
  description = "Azure region where GlobalSend resources will be deployed."
  type        = string
}

# Storage account name prefix for ZIP deployment
variable "storage_account_name" {
  description = "Prefix for the storage account used for ZIP deployment."
  type        = string
  # default = "globalsendzip"
}

# Storage container name for storing the ZIP package
variable "storage_container_name" {
  description = "Name of the storage container for ZIP deployment."
  type        = string
  default     = "site-deploy"
}

# Name of the ZIP blob uploaded for deployment
variable "storage_blob_name" {
  description = "Name of the ZIP blob uploaded for deployment."
  type        = string
  default     = "site.zip"
}


