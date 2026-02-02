variable "resource_group_name" {
  description = "Name of the resource group for the GlobalSend App Service."
  type        = string
  default = "globalsend_rrg"
}

variable "location" {
  description = "Azure region where GlobalSend resources will be deployed."
  type        = string
  default = "centralus"
}

variable "subscription_id" {
  description = "Azure subscription ID to deploy resources"
  type        = string
  default     = "45f251e8-d84d-4b8e-ac63-77eef4482127"
}
