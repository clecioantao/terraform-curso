terraform {
  backend "azurerm" {
    resource_group_name = "terraformstate"
    storage_account_name = "tstatetreinamento"
    container_name = "terraformstate"
    key = "AiM+aoKM0u3BY66fGwRzsN9NJBKw4LilLt2VuxzMpEdq9DTOqAH8iVdf0cIe8D5Ivx/adA1NPtdt+AStvFc29g=="
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "rg-state" {
  name = "rg_terraform_com_state"
  location = "brazilsouth"
}