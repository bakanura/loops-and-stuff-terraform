output "vm_name" {
  description = "The name of the virtual machine"
  value = {
    for vm_key, vm_value in var.vms :
    vm_value => azurerm_windows_virtual_machine.example[vm_key].name
  }
}