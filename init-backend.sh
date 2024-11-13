#!/bin/bash

# Create backend.tf configuration file
cat <<EOF2 > backend.tf
terraform {
   backend "azurerm" {
     resource_group_name  = "terraform-state-rg"
     storage_account_name = "tfstateifkkcm"
     container_name       = "tfstate"
     key                  = "terraform.tfstate"
   }
}
EOF2

# Initialize Terraform with Azure backend
echo "Initializing Terraform with Azure backend..."
terraform init -reconfigure -input=false
echo "Backend initialization complete. Your state is now stored in Azure."

# Clean up local state files
rm -rf terraform.tfstate
rm -rf terraform.tfstate.backup
