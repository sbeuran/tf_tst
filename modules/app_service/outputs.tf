output "app_service_id" {
  value = azurerm_app_service.app_service.id
}

output "app_service_default_hostname" {
  value = azurerm_app_service.app_service.default_site_hostname
}
