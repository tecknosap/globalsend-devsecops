variable "log_analytics_workspace_name" {
  type    = string
  default = "globalsend-law"
}


variable "app_service_diagnostics_name" {
  type    = string
  default = "globalsend-appservice-diagnostics"
}

variable "storage_account_diagnostics_name" {
  type    = string
  default = "globalsend-storage-diagnostics"
}
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "target_app_service_id" {
  type = string
}

variable "target_storage_account_id" {
  type = string
}

variable "retention_in_days" {
  type    = number
  default = 30
}


