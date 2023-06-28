resource "azurerm_app_service" "app_service" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name

  app_service_plan_id = var.app_service_plan_id

  site_config {
    dotnet_framework_version = var.app_service_dotnet_framework_version
    scm_type                 = var.app_service_scm_type
  }

  app_settings = var.app_settings
}
