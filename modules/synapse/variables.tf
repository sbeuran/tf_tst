
# Input variables
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "synapse_workspace_name" {
  description = "Name of the Synapse workspace"
  type        = string
}

variable "storage_account_name_2" {
  description = "Name of the storage account"
  type        = string
}

variable "location" {
  description = "Azure region for the Synapse workspace"
  type        = string
}

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