# Loops and Stuff Terraform

![Terraform Badge](https://img.shields.io/badge/Terraform-%3E%3D0.12-blue)  
![Cloud Provider Badge](https://img.shields.io/badge/Cloud%20Provider-Any-blue)

A Terraform configuration showcasing loops, dynamic blocks, and advanced Terraform features. This setup promotes reusable code and efficient infrastructure management.

## 📋 Overview

This repository demonstrates:

- **Efficient Resource Creation**: Using loops to provision multiple instances
- **Dynamic Block Configurations**: Programmatically manage nested arguments
- **Modular Structure**: Organized for easy reusability across projects

## 🚀 Quick Start

To get started quickly, use the following configuration:

```hcl
module "example" {
  source = "github.com/bakanura/loops-and-stuff-terraform"

  # Customize variables
  resource_count = 3
  instance_type  = "Standard_B2ms"
}
```

## 📝 Prerequisites

- Terraform >= 0.12
- Cloud provider credentials

## 📂 Repository Structure

- **`main.tf`**: Core configuration using loops and dynamic blocks
- **`variables.tf`**: Parameterized input values for configurations
- **`outputs.tf`**: Declares outputs for accessing created resources
- **`backend.tf`**: Remote backend setup for state storage
- **`firewall.tf`**: Defines firewall rules and security settings
- **`network.tf`**: Provisions network infrastructure
- **`nsg.tf`**: Configures Network Security Groups
- **`vm.tf`**: Configures virtual machines

## ⚙️ Configuration

### Basic Usage

```hcl
module "basic" {
  source  = "github.com/bakanura/loops-and-stuff-terraform"
  vm_count = 2
}
```

### Advanced Usage with Custom Parameters

```hcl
module "custom" {
  source        = "github.com/bakanura/loops-and-stuff-terraform"
  instance_type = "Standard_B2ms"
  vm_count      = 5
  network_tags  = ["production", "web"]
}
```

## 📊 Inputs

| Name            | Description                          | Type           | Default          | Required |
|-----------------|--------------------------------------|----------------|------------------|----------|
| `vm_count`      | Number of VMs to create              | `int`          | `1`              | ✅        |
| `instance_type` | Type of instance for VM              | `string`       | `"Standard_B1s"` | ❌        |
| `network_tags`  | Tags for network resources           | `list(string)` | `[]`             | ❌        |

## 📤 Outputs

| Name            | Description                       |
|-----------------|-----------------------------------|
| `instance_ids`  | IDs of created instances          |
| `network_id`    | ID of created network             |

## 🔒 Security Best Practices

- **Encryption**: Data encrypted at rest and in transit
- **Network Security**: Network rules restrict access to resources
- **Dynamic Access Control**: Customizable role assignments

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a branch (`git checkout -b feature/NewFeature`)
3. Commit changes (`git commit -m 'Add NewFeature'`)
4. Push to branch (`git push origin feature/NewFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For questions and issues, please open an issue.

Made with ❤️ by [bakanura](https://github.com/bakanura)