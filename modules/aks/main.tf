data "azurerm_resource_group" "rg" {
  name = var.resource-group-name
}


resource "azurerm_kubernetes_cluster" "myaks" {
  name                = var.aks-name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = var.dns


  default_node_pool {
    name       = var.node-name
    node_count = var.node-count
    vm_size    = var.vm-size
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.myaks]
  filename   = "~/.kube/config"
  content    = azurerm_kubernetes_cluster.myaks.kube_config_raw
}
