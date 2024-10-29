locals {
  resource_group_name = "bulwark-rg"
  cluster_name        = "aks-weu-1"
}

resource "azurerm_resource_group" "neu-rg" {
  name     = local.resource_group_name
  location = var.location
  tags     = var.tags
}

module "vnet-neu-1" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.neu-rg.name
  vnet_name           = "bulwark-vnet1"
  subnet_name         = "bulwark-subnet-1"
  address_space       = ["10.38.112.0/20"]
  subnet_prefixes     = ["10.38.122.0/24"]
  location            = var.location
  tags                = var.tags
}

module "aks_neu_1" {
  depends_on          = [module.vnet-neu-1]
  source              = "./modules/k8s"
  aks_name            = local.cluster_name
  resource_group_name = azurerm_resource_group.neu-rg.name
  subnet_id           = module.vnet-neu-1.aks_subnet_id
  location            = var.location
  dns_prefix          = "aksdns"
  node_vm_size        = "Standard_DS2_v2"
  node_count          = 1
  tags                = var.tags
}


