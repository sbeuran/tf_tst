variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "sa-name" {
  description = "Storage account name"
  type        = string
}

variable "sa-name-2" {
  description = "Storage account name"
  type        = string
}

variable "fs-name" {
  description = "File system name"
  type        = string
}

variable "synapse-name" {
  description = "Synapse workspace name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}


variable "min_tls_version" {
  description = "File share enabling for Data Lake"
  type        = string
}


variable "access_tier" {
  description = "The access tier for Azure Data Lake Storage. Valid values are 'Hot' and 'Cold'."
  type        = string
  default     = "Hot"
  validation {
    condition     = can(regex("^Hot$|^Cold$", var.access_tier))
    error_message = "Invalid access tier. Valid values are 'Hot' and 'Cold'."
  }
}

# variable "container_name" {
#   type        = string
#   description = "Name of the container"
# }


variable "synapse_sql_pool_name" {
  description = "Name of the SQL Pool for the Synapse workspace"
  type        = string
}

variable "synapse_sql_pool_sku_name" {
  description = "SKU of the SQL Pool for the Synapse workspace"
  type        = string
}

variable "create_mode" {
  description = "Valid Values for SQL Pool creation: Default, Recovery or PointInTimeRestore"
  type        = string
}

variable "spark_pool_name" {
  description = "Name of the Spark Pool for the Synapse workspace"
  type        = string
}

variable "node_size_family" {
  description = "Node size family of the Spark Pool for the Synapse workspace"
  type        = string
}

variable "node_size" {
  description = "Node size of the Spark Pool for the Synapse workspace"
  type        = string
}

variable "cache_size" {
  description = "Cache size family of the Spark Pool for the Synapse workspace"
  type        = number
}
variable "node_count" {
  description = "Node count of the Spark Pool for the Synapse workspace"
  type        = number
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
}

variable "address_space" {
  description = "Address space of the virtual network"
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "List of subnet address prefixes"
  type        = list(string)
}
