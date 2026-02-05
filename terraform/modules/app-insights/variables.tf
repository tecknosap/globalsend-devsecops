
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "application_insight_name" {
  type    = string
  default = "globalsend-appinsights"
}
variable "workspace_id" {
  type = string
}