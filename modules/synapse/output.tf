# Output variables
output "synapse_workspace_name" {
  value = azurerm_synapse_workspace.workspace.name
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}