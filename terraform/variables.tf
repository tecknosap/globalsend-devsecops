# ---------------------------
# Azure Deployment Variables
# ---------------------------

# Azure region where resources will be deployed
variable "location" {
  description = "Azure region where GlobalSend resources will be deployed."
  type        = string
  default     = "centralus"
}

# Deployment environment (e.g., dev, staging)
variable "environment" {
  description = "Deployment environment (dev or staging)."
  type        = string
  default     = "dev"
}

# Name of the Linux Web App
variable "app_service_name" {
  description = "Name of the GlobalSend App Service."
  type        = string
  default     = "globalsend-app"
}

# Name of the App Service Plan
variable "app_service_plan_name" {
  description = "Name of the GlobalSend App Service Plan."
  type        = string
  default     = "globalsend-plan"
}

# Storage account prefix for ZIP deployment
variable "storage_account_name" {
  description = "Prefix for the storage account used for ZIP deployment."
  type        = string
  default     = "globalsendzip"
}

variable "application_insights_app_id" {
  description = "The Application Insights Application ID for the deployed instance."
  type        = string
  
}


# Optional: Azure subscription ID (commented out)
# variable "subscription_id" {
#   description = "Azure subscription ID to deploy resources."
#   type        = string
# }
