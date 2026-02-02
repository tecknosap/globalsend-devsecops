variable "resource_group_name" {
  description = "Name of the resource group for the GlobalSend App Service."
  type        = string
}

variable "location" {
  description = "Azure region where GlobalSend resources will be deployed."
  type        = string
}


variable "storage_account_name" {
  description = "Prefix for the storage account used for ZIP deployment."
  type        = string
  default     = "globalsendzip"
}

variable "storage_container_name" {
  description = "Name of the storage container for ZIP deployment."
  type        = string
  default     = "site-deploy"
}

variable "storage_blob_name" {
  description = "Name of the ZIP blob uploaded for deployment."
  type        = string
  default     = "site.zip"
}

# variable "site_source_dir" {
#   description = "Path to the folder containing the website files to be zipped and deployed."
#   type        = string
  
# }