# Common input variables
variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "workspace_id" {
  type = string
}

# Application Insights configuration
variable "application_insight_name" {
  type        = string
  description = "Name of the Application Insights resource"
  # default = "globalsend-application-insights"
}
