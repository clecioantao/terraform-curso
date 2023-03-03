
# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources-group-${var.ambiente}-${random_integer.ri.result}"
  location = var.location
}

resource "azurerm_service_plan" "example" {
  name                = "example-service-plan-${var.ambiente}-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "example" {
  name                  = "example-webapp-${var.ambiente}-${random_integer.ri.result}"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  service_plan_id       = azurerm_service_plan.example.id
  https_only            = true
  site_config { 
    minimum_tls_version = "1.2"
  }

}

resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id             = azurerm_linux_web_app.example.id
  repo_url           = "https://github.com/clecioantao/nodejs-docs-hello-world"
  branch             = "main"
  use_manual_integration = true
  use_mercurial      = false
}

