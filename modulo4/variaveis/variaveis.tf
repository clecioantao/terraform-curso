variable "location" {
  type        = string
  description = "Localização dos Recursos do Azure"
  //default     = "eastus"
}

variable "tags" {
  type        = map(any)
  description = "Tags nos recursos e serviços Azure"
  default = {
    ambiente    = "dev"
    responsavel = "Clecio"
  }
}

variable "name-rg" {
  type        = string
  description = "Nome do Resource Group"
  default     = "rg-variaveis"
}

variable "vnetenderecos" {
    type = list
    default = [ "10.0.0.0/16" , "192.168.0.0/16"]
  
}