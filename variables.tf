variable "region" {
  description = "The Azure region to deploy resources in"
  default     = "westeurope"
}

# Define a list/map of VMs you want to create
variable "vms" {
  type = map(string)
  default = {
    1 = "Node1"
    2 = "Node2"
    3 = "Node3"
  }
}

variable "username" {
  type    = string
  default = "cloudUser"
}

variable "password" {
  type    = string
  default = "Passw0rd1234"
}