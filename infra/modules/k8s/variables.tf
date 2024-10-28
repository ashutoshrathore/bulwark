variable "aks_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "Azure region for AKS"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the AKS cluster"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the AKS node pool"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the AKS node pool"
  type        = number
  default     = 2
}

variable "node_vm_size" {
  description = "VM size for the AKS node pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "tags" {
  description = "Tags for the AKS cluster"
  type        = map(string)
  default     = {}
}
