# Input variables
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "file_system_name" {
  description = "Name of the Data Lake Gen 2 file system"
  type        = string
}

variable "location" {
  description = "Location of the Data Lake Gen 2 file system"
  type        = string
}

variable "access_tier" {
  description = "The access tier for Azure Data Lake Storage. Valid values are 'Hot' and 'Cold'."
  type        = string
  default     = "Hot"
}


variable "min_tls_version" {
  description = "Min TLS version for storage account for the Data Lake Gen 2 file system"
  type        = string
}

variable "filesystems" {
 type    = list(string)
}


variable "subnet_id" {
  description = "Subnet ID"
}