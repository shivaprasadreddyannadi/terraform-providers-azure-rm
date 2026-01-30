````md
# Azure Log Analytics Workspace – Basic Setup Module

## Overview
This Terraform module creates an Azure Log Analytics Workspace inside a new resource group.

A Log Analytics Workspace is commonly used to:
- Collect logs and metrics from Azure resources
- Support monitoring solutions like Azure Monitor
- Store diagnostic logs for services such as AKS, VMs, and App Services

This module is intentionally simple and suitable for beginners or basic setups.

---

## What this module creates
- Resource Group
- Azure Log Analytics Workspace

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
module "log_analytics" {
  source = "github.com/<your-username>/<your-repo>//modules/<module-name>"

  prefix   = "demo"
  location = "eastus"
}
```

---

## Input Variables

| Name     | Description                                                             | Type   | Required |
| -------- | ----------------------------------------------------------------------- | ------ | :------: |
| prefix   | Naming prefix used for the resource group and Log Analytics Workspace   | string |    yes   |
| location | Azure region where resources will be created (example: eastus, westus2) | string |    yes   |

---

## Outputs

This module does not currently expose any outputs.
You can add outputs later if you need values such as:

* Workspace ID
* Workspace name

---

## Notes (Important)

* The resource group name will be created as:
  `<prefix>-resources`
* The Log Analytics Workspace name will be created as:
  `<prefix>-laworkspace`
* The workspace SKU is set to **PerGB2018**, which is commonly used for most workloads.
* Naming conventions can be adjusted by updating the `prefix` variable.

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

```
