module "aks-east" {
  source                          = "Azure/aks/azurerm"
  version                         = "6.2.0"
  resource_group_name             = azurerm_resource_group.this.name
  location                        = var.location_one
  kubernetes_version              = var.kubernetes_version
  orchestrator_version            = var.kubernetes_version
  prefix                          = "fleet1"
  network_plugin                  = "azure"
  vnet_subnet_id                  = lookup(module.vnet-east.vnet_subnets_name_id, "subnet0")
  sku_tier                        = "Standard" # defaults to Free
  enable_auto_scaling             = true
  agents_min_count                = 1
  agents_max_count                = 5
  agents_count                    = null # Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes.
  agents_max_pods                 = 100
  agents_pool_name                = "system"
  agents_availability_zones       = ["1", "2"]
  agents_size                     = var.agents_size
  network_policy                  = "azure"
  net_profile_dns_service_ip      = "10.0.0.10"
  net_profile_service_cidr        = "10.0.0.0/16"
  log_analytics_workspace_enabled = "false"
  depends_on                      = [module.vnet-east]
}

module "aks-west" {
  source                          = "Azure/aks/azurerm"
  version                         = "6.2.0"
  resource_group_name             = azurerm_resource_group.this.name
  location                        = var.location_two
  kubernetes_version              = var.kubernetes_version
  orchestrator_version            = var.kubernetes_version
  prefix                          = "fleet2"
  network_plugin                  = "azure"
  vnet_subnet_id                  = lookup(module.vnet_west.vnet_subnets_name_id, "subnet0")
  sku_tier                        = "Standard" # defaults to Free
  enable_auto_scaling             = true
  agents_min_count                = 1
  agents_max_count                = 5
  agents_count                    = null # Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes.
  agents_max_pods                 = 100
  agents_pool_name                = "system"
  agents_availability_zones       = ["1", "2"]
  agents_size                     = var.agents_size
  network_policy                  = "azure"
  net_profile_dns_service_ip      = "10.0.0.10"
  net_profile_service_cidr        = "10.0.0.0/16"
  log_analytics_workspace_enabled = "false"

  depends_on = [module.vnet_west]
}