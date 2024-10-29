output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config
}

# output "client_certificate" {


output "host" {
  value = length(azurerm_kubernetes_cluster.aks.kube_admin_config) > 0 ? azurerm_kubernetes_cluster.aks.kube_admin_config[0].host : null
}

output "client_key" {
  value = length(azurerm_kubernetes_cluster.aks.kube_admin_config) > 0 ? azurerm_kubernetes_cluster.aks.kube_admin_config[0].client_key : null
}

output "client_certificate" {
  value = length(azurerm_kubernetes_cluster.aks.kube_admin_config) > 0 ? azurerm_kubernetes_cluster.aks.kube_admin_config[0].client_certificate : null
}

output "cluster_ca_certificate" {
  value = length(azurerm_kubernetes_cluster.aks.kube_admin_config) > 0 ? azurerm_kubernetes_cluster.aks.kube_admin_config[0].cluster_ca_certificate : null
}


output "kube_admin_config_raw" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
}

output "cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
}


