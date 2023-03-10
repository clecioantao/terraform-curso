provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "grupo-recurso" {
  count    = 5
  location = "brazilsouth"
  name     = "rg-terraform-mod5-${count.index}"
  tags = {
    data        = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
    ambiente    = lower("Homologação")
    responsavel = upper("Clecio Antao")
    tecnologia  = title("terraform azure")
  }
}

variable "vnettips" {
  type    = list(any)
  default = ["10.0.0.0/8"]
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnettreinoazure"
  location            = "brazilsouth"
  resource_group_name = "rg-terraform-mod5-1"
  address_space       = length(var.vnettips) == 0 ? ["10.0.0.0/16", "192.168.0.0/16"] : var.vnettips
  depends_on = [
    azurerm_resource_group.grupo-recurso
  ]
  //concat(var.vnettips, [ "192.168.0.0/16" ])

}

output "vnet-numeroips" {
  value = length(azurerm_virtual_network.vnet.address_space)
}