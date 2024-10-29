variable "subscription_id" {
  description = "subscription id for running terraform plan locally"
  type        = string
  default     = "ebfb085f-7f7a-413e-b90c-9dd84a6008e4"
}

variable "ARM_TENANT_ID" {
  description = "Tenant id"
  type        = string
}

variable "ARM_CLIENT_ID" {
  description = "CLIENT id"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default = {
    owner                = "Platform-Team"
    managed_by_terraform = true
  }
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "resource_group_name" {
  description = "Name of Resource group"
  default     = "bulwark-rg"
  type        = string
}