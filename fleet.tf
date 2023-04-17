## for this code snippet to work you must have the following command ran in the tenant
## az feature register --namespace Microsoft.ContainerService --name FleetResourcePreview

## Reference https://learn.microsoft.com/en-us/azure/templates/microsoft.containerservice/fleets?pivots=deployment-language-terraform

resource "azurerm_kubernetes_fleet_manager" "aks-fleet-west" {
   
  hub_profile {
    dns_prefix = "fleet-west"
  } 

  location		= var.location_one
  name    		= "aks-fleet-west"
  resource_group_name	= azurerm_resource_group.this.name
  tags = {
    tagName1 	= "production-aks1"
    tagName2    = "production-aksfleet"
  }
}


#https://learn.microsoft.com/en-us/azure/templates/microsoft.containerservice/fleets/members?pivots=deployment-language-terraform


resource "azurerm_kubernetes_fleet_manager" "aks-hub-1" {
  hub_profile {
    dns_prefix = "fleet-west"
  } 
  location            = var.location_one
  name                = "aks-hub1"
  resource_group_name = azurerm_resource_group.rg-fleet.name
}

resource "azurerm_kubernetes_fleet_manager" "aks-hub-2" {
  hub_profile {
    dns_prefix = "fleet-west"
  } 
  location             = var.location_two
  name 	               = "aks-hub2"  
  resource_group_name  = azurerm_resource_group.rg-fleet.name
}
