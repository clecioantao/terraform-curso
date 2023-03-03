resource "azurerm_resource_group" "rg" {
  name     = "appservice-rg--${lower(var.ambiente)}"
  location = var.location
}

resource "azurerm_app_service_plan" "plan" {
  name                = "appserviceplan-${lower(var.ambiente)}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appservice" {
  name                = "tfappservice-cle-${lower(var.ambiente)}"
  location            = azurerm_app_service_plan.plan.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    dotnet_framework_version = "v4.0"
  }

  app_settings = {
    "chave" = "123456"
  }

}

