terraform {
  required_version = ">= 0.14"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

provider "helm" {
  kubernetes {
    host                   = module.aks_neu_1.host
    cluster_ca_certificate = base64decode(module.aks_neu_1[0].cluster_certificate)
    client_certificate     = base64decode(module.aks_neu_1[0].client_key)
    token                  = module.aks_neu_1[0].client_secret
  }
}
