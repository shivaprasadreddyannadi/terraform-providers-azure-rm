
````md
# Azure API Management (APIM) – Basic Setup Module

## Overview
This Terraform module creates a basic Azure API Management (APIM) setup and imports an API into APIM using an API specification file.

It is useful when you want a simple, working APIM setup for learning, testing, or a quick demo:
- Create an APIM service
- Import an API using OpenAPI / Swagger / WSDL
- Publish the API through a Product
- Control access using a Group and subscriptions

---

## What this module creates
- Resource Group
- Azure API Management Service (APIM)
- API imported from an API specification
- Product with subscriptions enabled
- Group
- Product to API association
- Product to Group association
- A basic APIM policy with empty pipeline stages

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

You also need an API specification file (OpenAPI/Swagger/WSDL), either:

* local file (recommended for learning)
* or a public URL

---

## Usage

### Example using a local OpenAPI file

```hcl
module "apim" {
  source = "github.com/<your-username>/<your-repo>//modules/<module-name>"

  prefix   = "demo"
  location = "eastus"

  open_api_spec_content_format = "openapi"
  open_api_spec_content_value  = file("${path.module}/openapi.yaml")
}
```

### Example using an API specification URL

```hcl
module "apim" {
  source = "github.com/<your-username>/<your-repo>//modules/<module-name>"

  prefix   = "demo"
  location = "eastus"

  open_api_spec_content_format = "openapi-link"
  open_api_spec_content_value  = "https://example.com/openapi.yaml"
}
```

---

## Input Variables

| Name                         | Description                                                                           | Type   | Required |
| ---------------------------- | ------------------------------------------------------------------------------------- | ------ | :------: |
| prefix                       | Short naming prefix used for APIM, API, product, group, and resource group            | string |    yes   |
| location                     | Azure region where resources will be created (example: eastus, westus2)               | string |    yes   |
| open_api_spec_content_format | Format of the API spec to import (example: openapi, openapi-link, swagger-json, wsdl) | string |    yes   |
| open_api_spec_content_value  | API definition source. Use a URL for link-based formats, otherwise inline content     | string |    yes   |

---

## Outputs

| Name                        | Description                                      |
| --------------------------- | ------------------------------------------------ |
| service_id                  | ID of the API Management service                 |
| gateway_url                 | Gateway URL of the APIM service                  |
| service_public_ip_addresses | Public IP addresses assigned to the APIM service |
| api_outputs                 | API details including ID, version, and state     |
| product_ids                 | ID of the Product created                        |
| product_api_ids             | ID of the Product-to-API association             |
| product_group_ids           | ID of the Product-to-Group association           |

---

## Notes (Important)

* The resource group name will be created as:
  `<prefix>-resources`
* The APIM service uses the **Developer SKU**, which is good for dev/test (not production scale).
* The API protocols in this example allow both `https` and `http`.
* The APIM policy included is a placeholder policy with empty stages.
* `publisher_name` and `publisher_email` are currently hardcoded as example values and can be converted to variables later.
* Your code currently uses `sku_name = "Developers_1"`. If you see a SKU error, change it to:
  `sku_name = "Developer_1"`.

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

### If the API import fails

* Check that `open_api_spec_content_format` matches the file type you are importing.
* If using a URL, confirm the URL is reachable and returns the spec content.

### If Azure authentication fails

Run:

```bash
az login
```

### If Terraform is deploying to the wrong subscription

Set the right subscription:

```bash
az account set --subscription "<subscription-id-or-name>"
```



