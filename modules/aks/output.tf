output "kube_config_file" {
  value     = azurerm_kubernetes_cluster.myaks.kube_config_raw
  sensitive = true
}