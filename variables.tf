variable "region" {
  description = "The Azure region to deploy resources in"
  default     = "westeurope"
}

# Define a list/map of VMs you want to create
variable "vms" {
  type = map(string)
  default = {
    vm1 = "Node1"
    vm2 = "Node2"
    vm3 = "Node3"
  }
}