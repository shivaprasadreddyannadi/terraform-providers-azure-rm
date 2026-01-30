variable "prefix" {
  description = "A short naming prefix applied to all resources created by this configuration."
}

variable "location" {
  description = "The Azure region where all resources defined in this configuration will be deployed."
}

variable "open_api_spec_content_format" {
  description = "Specifies the format of the API definition being imported, such as OpenAPI, Swagger, WSDL, or WADL, including inline and link-based variants."
}

variable "open_api_spec_content_value" {
  description = "The API definition source. Provide a URL when using a link-based format, or inline content for non-link formats."
}
