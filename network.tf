resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.region
  resource_group_name = azurerm_resource_group.example.name

  dynamic "subnet" {
    for_each = var.vms
    content {
      name             = "${subnet.value}-subnet-${random_string.suffix}"
      address_prefixes = ["10.${length(var.vms) + length(subnet.key)}.0/24"]
    }
  }
}
resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = var.region
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}