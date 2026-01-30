````md
# Azure Storage Account + Redis Cache (Premium) Module

## Overview
This Terraform module creates an Azure Storage Account and an Azure Redis Cache (Premium) inside a new resource group.

The Storage Account is used to store Redis backup data, while the Redis Cache is configured with persistence enabled.  
This setup is commonly used when you need a highly available Redis cache with backup support.

This module is kept simple and is suitable for learning, testing, or basic production-like environments.

---

## What this module creates
- Resource Group
- Azure Storage Account
- Azure Redis Cache (Premium SKU)
- Redis backup configuration using the Storage Account

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
module "redis" {
  source = "github.com/<your-username>/<your-repo>//modules/<module-name>"

  prefix   = "demo"
  location = "eastus"
}
```

---

## Input Variables

| Name     | Description                                                                 | Type   | Required |
| -------- | --------------------------------------------------------------------------- | ------ | :------: |
| prefix   | Naming prefix used for the resource group, storage account, and Redis cache | string |    yes   |
| location | Azure region where resources will be created (example: eastus, westus2)     | string |    yes   |

---

## Outputs

This module does not currently expose any outputs.

If needed, you can add outputs later for:

* Redis hostname
* Redis primary key
* Storage account name

---

## Notes (Important)

* The resource group name will be created as:
  `<prefix>-resources`
* The Storage Account name will be created as:
  `<prefix>sa`
* Storage Account names must be:

  * Globally unique
  * Lowercase only
  * Between 3 and 24 characters
* The Redis Cache name must also be **globally unique**.
* This module uses:

  * Redis SKU: **Premium**
  * Redis family: **P**
  * Redis capacity: **3**
* Non-SSL access to Redis is disabled for security.
* Redis backups are enabled and stored in the Storage Account using blob storage.

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

Set the correct subscription:

```bash
az account set --subscription "<subscription-id-or-name>"
```

### If resource name already exists

Because Storage Accounts and Redis Cache names must be globally unique, update the `prefix` value to something more unique (for example, add numbers).

---

```
