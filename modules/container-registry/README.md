````md
# Azure Container Registry (ACR) – Basic Setup Module

## Overview
This Terraform module creates an Azure Container Registry (ACR) in a new resource group.

This is a simple starter module that is useful when you want a registry to:
- Store Docker images
- Use with AKS, App Services, or CI/CD pipelines
- Test basic AzureRM Terraform deployments

---

## What this module creates
- Resource Group
- Azure Container Registry (ACR)

---

## Prerequisites
Before using this module, make sure you have:
- An Azure subscription
- Terraform installed (Terraform 1.4+ recommended)
- Azure CLI installed
- Logged in to Azure:

```bash
az login
````

---

## Usage

### Example

```hcl
module "acr" {
  source = "github.com/<your-username>/<your-repo>//modules/<module-name>"

  prefix   = "demo"
  location = "eastus"
}
```

---

## Input Variables

| Name     | Description                                                             | Type   | Required |
| -------- | ----------------------------------------------------------------------- | ------ | :------: |
| prefix   | Naming prefix used for the resource group and ACR name                  | string |    yes   |
| location | Azure region where resources will be created (example: eastus, westus2) | string |    yes   |

---

## Outputs

| Name         | Description                                                 |
| ------------ | ----------------------------------------------------------- |
| login_server | The ACR login server URL (example: `myregistry.azurecr.io`) |

---

## Notes (Important)

* The resource group name will be created as:
  `<prefix>-resources`
* The ACR name will be created as:
  `<prefix>registry`
* Azure Container Registry names must be:

  * Globally unique
  * Lowercase only
  * Between 5 and 50 characters
* This module uses ACR SKU: **Standard**

If `terraform apply` fails because the registry name already exists, change the prefix to something more unique (example: `demo12345`).

---

## How to Deploy (Step-by-step)

### 1) Initialize Terraform

```bash
terraform init
```

### 2) Validate configuration

```bash
terraform validate
```

### 3) Review the plan (recommended)

```bash
terraform plan
```

### 4) Apply and create resources

```bash
terraform apply
```

---

## Cleanup (Destroy)

To remove everything created by this module:

```bash
terraform destroy
```

---

## Quick Troubleshooting

### If Azure authentication fails

Run:

```bash
az login
```

### If Terraform deploys to the wrong subscription

Set the right subscription:

```bash
az account set --subscription "<subscription-id-or-name>"
```

### If ACR name is not available

Make your prefix more unique (ACR name must be globally unique).

```
