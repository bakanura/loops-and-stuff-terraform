resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = var.region
}
