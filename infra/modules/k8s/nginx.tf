resource "helm_release" "nginx_ingress" {
  depends_on = [ azurerm_kubernetes_cluster.aks ]
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "kube-system"

  set {
    name  = "controller.publishService.enabled"
    value = "true"
  }
}