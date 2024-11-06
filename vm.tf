resource "azurerm_windows_virtual_machine" "example" {
  for_each = var.vms

  name                = "${each.value}-${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_A1_v2"
  admin_username      = var.username
  admin_password      = var.password
  network_interface_ids = [
    azurerm_network_interface.example[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}