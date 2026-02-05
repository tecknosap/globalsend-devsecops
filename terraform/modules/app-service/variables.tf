# Name of the resource group for the App Service
variable "resource_group_name" {
  description = "Name of the resource group for the GlobalSend App Service."
  type        = string
}

# Azure region to deploy resources
variable "location" {
  description = "Azure region where GlobalSend resources will be deployed."
  type        = string
}

# Name of the Linux Web App
variable "app_service_name" {
  description = "Name of the GlobalSend App Service."
  type        = string
}

# Name of the App Service Plan
variable "app_service_plan_name" {
  description = "Name of the GlobalSend App Service Plan."
  type        = string
}

# URL of the ZIP package for deployment
variable "zip_blob_url" {
  description = "URL of the ZIP file stored in the storage account."
  type        = string
}

variable "app_insights_connection_string" {
  type = string
}


