# Common input variables
variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

# Log Analytics configuration
variable "log-analytics_workspace_name" {
  type        = string
  description = "Name of the Log Analytics workspace"
  # default = "globalsend-log-analytics-workspace"
}

# Diagnostic settings configuration
variable "diagnostic_setting" {
  description = "Name of the diagnostic setting to create"
  type        = string
  default     = "globalsend-diagnostic-setting"
}

variable "app_service_target_resource_id" {
  description = "Resource ID of the App Service for diagnostics"
  type        = string
}

variable "storage_account_target_resource_id" {
  description = "Resource ID of the Storage Account for diagnostics"
  type        = string
}
