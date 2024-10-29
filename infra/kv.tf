resource "azurerm_key_vault" "bulwark-vault-neu" {
  name                     = "bulwark-key-vault"
  resource_group_name      = azurerm_resource_group.neu-rg.name
  location                 = var.location
  sku_name                 = "standard"
  purge_protection_enabled = false
  tags                     = var.tags
  tenant_id                = var.tenant_id

}


# Put K8S Secrets to KeyVault
resource "azurerm_key_vault_secret" "client_certificate" {
  name         = "${local.cluster_name}-client-certificate"
  value        = module.aks_neu_1.client_certificate
  key_vault_id = azurerm_key_vault.bulwark-vault-neu.id
  tags         = var.tags
}

resource "azurerm_key_vault_secret" "host" {

  name         = "${local.cluster_name}-host"
  value        = module.aks_neu_1.host
  content_type = "password"
  key_vault_id = azurerm_key_vault.bulwark-vault-neu.id
  tags         = var.tags
}

resource "azurerm_key_vault_secret" "client_key" {

  name         = "${local.cluster_name}-client-key"
  value        = module.aks_neu_1.client_key
  key_vault_id = azurerm_key_vault.bulwark-vault-neu.id
  tags         = var.tags
}

resource "azurerm_key_vault_secret" "cluster_ca_certificate" {

  name         = "${local.cluster_name}-cluster-ca-certificate"
  value        = module.aks_neu_1.cluster_ca_certificate
  key_vault_id = azurerm_key_vault.bulwark-vault-neu.id
  tags         = var.tags
}


resource "azurerm_key_vault_secret" "kube_admin_config" {
  name         = "${local.cluster_name}-kube-admin-config-raw"
  value        = module.aks_neu_1.kube_admin_config_raw
  key_vault_id = azurerm_key_vault.bulwark-vault-neu.id
  content_type = "password"
}

resource "azurerm_key_vault_access_policy" "tf_access" {
  depends_on = [ azurerm_key_vault.bulwark-vault-neu ]
  key_vault_id = azurerm_key_vault.bulwark-vault-neu.id
  tenant_id = var.tenant_id
  object_id = "ea2d8618-4f58-4d9b-9226-43e9a048d8ff"
  key_permissions = [ "Get", "List", "Create" ]
  secret_permissions = [ "Get", "List", "Set" ]
  certificate_permissions = [ "Get", "List", "Create" ]
}

