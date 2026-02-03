# variable "resource_group_name" {
#   description = "Name of the resource group for the GlobalSend App Service."
#   type        = string
#   default = "globalsend_rg"
# }

variable "location" {
  description = "Azure region where GlobalSend resources will be deployed."
  type        = string
  default     = "centralus"
}

# variable "subscription_id" {
#   description = "Azure subscription ID to deploy resources"
#   type        = string
#   # default     = "45f251e8-d84d-4b8e-ac63-77eef4482127"
# }

variable "environment" {
  description = "Deployment environment (dev or staging)"
  type        = string
   default     = "dev"
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

variable "storage_account_name" {
  description = "Prefix for the storage account used for ZIP deployment."
  type        = string
  default     = "globalsendzip"
}


