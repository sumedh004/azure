module "aks" {
  source              = "./modules/aks"
  resource-group-name = var.resource-group-name
  aks-name            = var.aks-name
  node-name           = var.node-name
  node-count          = var.node-count
  vm-size             = var.vm-size
  dns                 = var.dns

}