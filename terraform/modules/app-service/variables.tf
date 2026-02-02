variable "resource_group_name" {
  description = "Name of the resource group for the GlobalSend App Service."
  type        = string
}

variable "location" {
  description = "Azure region where GlobalSend resources will be deployed."
  type        = string
}

variable "app_service_name" {
  description = "Name of the GlobalSend App Service."
  type        = string
  default     = "globalsend-app"
}

variable "app_service_plan_name" {
  description = "Name of the GlobalSend App Service Plan."
  type        = string
  default     = "globalsend-plan"
}

variable "zip_blob_url" {
  description = "URL of the ZIP file stored in the storage account."
  type        = string
}