variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "log-analytics_workspace_name" {
  type = string
  description = "Name of the Log Analytics workspace"
  default = "globalsend-log-analytics-workspace"
}