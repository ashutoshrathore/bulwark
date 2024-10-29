variable "subscription_id" {
  description = "subscription id for running terraform plan locally"
  type        = string
  default     = "ebfb085f-7f7a-413e-b90c-9dd84a6008e4"
}

variable "tenant_id" {
  description = "Tenant id"
  type        = string
  default     = "b57c4b9d-dc3e-4137-b4c9-05026731d558"
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