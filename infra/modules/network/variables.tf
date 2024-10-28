variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "The address space for the Virtual Network"
  type        = list(string)
}

variable "location" {
  description = "The Azure location"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
}