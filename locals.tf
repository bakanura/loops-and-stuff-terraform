# Collect the subnet addresses for VM subnets
locals {
  vm_subnet_numbers  = [for subnet in azurerm_virtual_network.example.subnet : tonumber(split(".", subnet.address_prefixes[0])[2])]
  next_subnet_number = max(local.vm_subnet_numbers...) + 1
}