
provider "azurerm" {
  features {}
}

# Storage Account
resource "azurerm_storage_account" "storage" {
  name                      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  account_kind              = "StorageV2"
  access_tier               = var.access_tier
  enable_https_traffic_only = true
  is_hns_enabled            = true
  min_tls_version           = "TLS1_2"

network_rules {
    default_action             = "Allow"
    bypass                     = ["Metrics", "Logging"]
  }

}



resource "azurerm_storage_data_lake_gen2_filesystem" "filesystems" {
  count                 = length(var.filesystems)
  name                  = var.filesystems[count.index]
  storage_account_id    = azurerm_storage_account.storage.id

  depends_on         = [azurerm_storage_account.storage]
}