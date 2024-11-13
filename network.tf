resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.region
  resource_group_name = azurerm_resource_group.example.name

  dynamic "subnet" {
    for_each = var.vms
    content {
      name             = "${subnet.value}-subnet-${random_string.suffix.result}"
      address_prefixes = ["10.0.${subnet.key}.0/24"]
    }
  }
}

# Vm network
resource "azurerm_network_interface" "example" {
  for_each = var.vms

  name                = "nic-${each.key}-${random_string.suffix.result}"
  location            = var.region
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = tolist(azurerm_virtual_network.example.subnet)[tonumber(each.key) - 1].id
    private_ip_address_allocation = "Dynamic"
  }
}