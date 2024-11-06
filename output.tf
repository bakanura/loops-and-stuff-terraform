output "vm_name" {
  description = "The name of the virtual machine"
  value = {
    for vm_key, vm in azurerm_windows_virtual_machine.example :
    vm_key => vm.name
  }
}