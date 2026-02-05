variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "log-analytics_workspace_name" {
  type = string
  description = "Name of the Log Analytics workspace"
  # default = "globalsend-log-analytics-workspace"
}

variable "diagnostic_setting" {
  description = "Name of the diagnostic setting to create"
  type        = string
  default = "globalsend-diagnostic-setting"
}

variable "app_service_target_resource_id" {
  description = "The ID of the resource (App Service, Storage Account, etc.) to attach diagnostics to"
  type        = string
}
variable "storage_account_target_resource_id" {
  description = "The ID of the resource (App Service, Storage Account, etc.) to attach diagnostics to"
  type        = string
}


