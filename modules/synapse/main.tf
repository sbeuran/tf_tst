# main.tf

# Provider configuration for Azure
provider "azurerm" {
  features {}
}


# Storage Account
resource "azurerm_storage_account" "storage" {
  name                      = var.storage_account_name_2
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
}

# Synapse Workspace
resource "azurerm_synapse_workspace" "workspace" {
  name                                 = var.synapse_workspace_name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.file_system.id


  identity {
    type = "SystemAssigned"
  }

}
resource "azurerm_storage_data_lake_gen2_filesystem" "file_system" {
  name               = "data-lake-filesystem"
  storage_account_id = azurerm_storage_account.storage.id
}


resource "azurerm_synapse_sql_pool" "sql_pool" {
  name                 = var.synapse_sql_pool_name
  synapse_workspace_id = azurerm_synapse_workspace.workspace.id
  sku_name             = var.synapse_sql_pool_sku_name
  create_mode          = var.create_mode
}


resource "azurerm_synapse_spark_pool" "spark_pool" {
  name                 = var.spark_pool_name
  synapse_workspace_id = azurerm_synapse_workspace.workspace.id
  node_size_family     = var.node_size_family
  node_size            = var.node_size
  cache_size           = var.cache_size
  node_count           = var.node_count
}













//resource "azurerm_synapse_firewall_rule" "example" {
//name                 = "AllowAll"
//synapse_workspace_id = azurerm_synapse_workspace.example.id
//start_ip_address     = "0.0.0.0"
//end_ip_address       = "255.255.255.255"
//}
