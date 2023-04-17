module "vnet-east" {
    source              = "Azure/subnets/azurerm"
    version             = "1.0.0"
    resource_group_name = azurerm_resource_group.this.name
    subnets = {
        subnet0 = {
            address_prefixes = ["10.50.0.0/16"]
        }
    }
    virtual_network_address_space = ["10.50.0.0/16"]
    virtual_network_location      = var.location_one
    virtual_network_name          = "fleet-virtual-network"
}

module "vnet_west" {
    source              = "Azure/subnets/azurerm"
    version             = "1.0.0"
    resource_group_name = azurerm_resource_group.this.name
    subnets = {
        subnet0 = {
            address_prefixes = ["10.50.0.0/16"]
        }
    }
    virtual_network_address_space = ["10.50.0.0/16"]
    virtual_network_location      = var.location_two
    virtual_network_name          = "fleet-virtual-network-1"
}

resource "azurerm_virtual_network_peering" "fleet-west" {
    name                      = "fleet-west"
    resource_group_name       = azurerm_resource_group.this.name
    virtual_network_name      = module.vnet-east.vnet_name
    remote_virtual_network_id = module.vnet_west.vnet_id
}

resource "azurerm_virtual_network_peering" "fleet-east" {
    name                      = "fleet-east"
    resource_group_name       = azurerm_resource_group.rg-fleet.name
    virtual_network_name      = module.vnet_west.vnet_name
    remote_virtual_network_id = module.vnet-east.vnet_id              
}
