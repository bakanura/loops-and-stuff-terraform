resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = var.region
}
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}