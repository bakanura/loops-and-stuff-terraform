provider "azurerm" {
  features {}
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}


resource "random_password" "vm_password" {
  length  = 16
  special = true
}
