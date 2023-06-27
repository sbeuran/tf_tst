# Create an App Service plan
resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = var.app_service_plan_sku_tier
    size = var.app_service_plan_sku_size
  }
}

# Create an App Service
resource "azurerm_app_service" "example" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    dotnet_framework_version = var.app_service_dotnet_framework_version
    scm_type                 = var.app_service_scm_type
  }

  app_settings = var.app_settings
}
