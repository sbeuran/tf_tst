output "app_service_id" {
  value = azurerm_app_service.example.id
}

output "app_service_default_hostname" {
  value = azurerm_app_service.example.default_site_hostname
}