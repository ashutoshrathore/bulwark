terraform {
  required_version = ">= 0.14"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = ">=4.0.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
#   tenant_id = var.tenant_id
#   client_id = var.client_id
#   client_secret = var.client_secret

}