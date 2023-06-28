variable "app_service_name" {
  description = "Name of the App Service"
  type        = string
}

variable "location" {
  description = "Location/region of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "app_service_plan_id" {
  description = "ID of the App Service Plan"
  type        = string
}

variable "app_service_dotnet_framework_version" {
  description = "Version of .NET Framework"
  type        = string
  default     = "v4.0"
}

variable "app_service_scm_type" {
  description = "SCM type for the App Service"
  type        = string
  default     = "LocalGit"
}

variable "app_settings" {
  description = "Additional app settings for the App Service"
  type        = map(string)
  default     = {}
}
