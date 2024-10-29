resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.subnet_prefixes
}

resource "azurerm_network_security_group" "nsg" {
  name = "${var.subnet_name}-nsg"
  resource_group_name = var.resource_group_name
  location = var.location
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg" {
  network_security_group_id = azurerm_network_security_group.nsg.id
  subnet_id = azurerm_subnet.aks_subnet.id
}