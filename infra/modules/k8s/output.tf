output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config
}


output "host" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].host
}

output "client_key" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].client_key
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
}


output "kube_admin_config_raw" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
}

output "cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
}


