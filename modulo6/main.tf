terraform {
  backend "azurerm" {
    resource_group_name = "terraformstate"
    storage_account_name = "tstatetreinamento"
    container_name = "terraformstate"
    key = "OH4u8frqB2ypF3vFnNykS386IWei8dcBJXNsYuW2XW7PkbA61hJSviv3fcdJb0JMSqm0jRHaCe8Y+AStBysanQ=="
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