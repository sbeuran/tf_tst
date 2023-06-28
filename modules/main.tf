terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.51.0"

    }

  }
  required_version = "1.4.4"
  backend "azurerm" {

    resource_group_name  = "VisualStudioOnline-D4FF5A93ACC5491682990BA47875F824"
    storage_account_name = "stepstonestoragestate"
    container_name       = "stepstone-container-state-test"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}


module "azure_data_lake_gen2" {
  source               = "./datalake"
  resource_group_name  = var.resource_group_name
  storage_account_name = var.sa-name
  file_system_name     = var.fs-name
  location             = var.location
  access_tier          = var.access_tier
  min_tls_version      = var.min_tls_version
  subnet_id            = module.network.subnet_id
  filesystems          = ["raw-container", "staging-container", "base-container", "curated-container"]

}


module "azure_synapse" {
  source                    = "./synapse"
  resource_group_name       = var.resource_group_name
  synapse_workspace_name    = var.synapse-name
  storage_account_name_2    = var.sa-name-2
  location                  = var.location
  synapse_sql_pool_name     = var.synapse_sql_pool_name
  synapse_sql_pool_sku_name = var.synapse_sql_pool_sku_name
  create_mode               = var.create_mode
  spark_pool_name           = var.spark_pool_name
  node_size_family          = var.node_size_family
  node_size                 = var.node_size
  cache_size                = var.cache_size
  node_count                = var.node_count
}


module "network" {
  source               = "./virtual-network"
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  address_space        = var.address_space
  subnet_prefixes      = var.subnet_prefixes
  nsg_name             = var.nsg_name
}


module "app_service" {
  source                  = "./modules/app_service"
  app_service_name        = var.app_service_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  app_service_plan_id     = module.app_service_plan.app_service_plan_id
  app_service_dotnet_framework_version = var.app_service_dotnet_framework_version
  app_service_scm_type    = var.app_service_scm_type
  app_settings            = var.app_settings
}

module "app_service_plan" {
  source                  = "./modules/app_service_plan"
  app_service_plan_name   = var.app_service_plan_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  app_service_plan_sku_tier = var.app_service_plan_sku_tier
  app_service_plan_sku_size = var.app_service_plan_sku_size
}
