output "kube_config_file" {
  value     = module.aks.kube_config_file
  sensitive = true
}