## for this code snippet to work you must have the following command ran in the tenant
## az feature register --namespace Microsoft.ContainerService --name FleetResourcePreview

## Reference https://learn.microsoft.com/en-us/azure/templates/microsoft.containerservice/fleets?pivots=deployment-language-terraform

resource "azapi_resource" "aks-fleet-west" {
  type = "Microsoft.ContainerService/fleets@2022-09-02-preview"
  name = "aks-fleet-west"
  location = var.location_one
  parent_id = azurerm_resource_group.this.id
  tags = {
    tagName1 = "production-aks1"
    tagName2 = "production-aksfleet"
  }


  body = jsonencode({
    properties = {
      hubProfile = {
        dnsPrefix = "aks-fleet-west"
      }
    }
  })
}


#https://learn.microsoft.com/en-us/azure/templates/microsoft.containerservice/fleets/members?pivots=deployment-language-terraform

resource "azapi_resource" "aks-hub-1" {
  type = "Microsoft.ContainerService/fleets/members@2022-09-02-preview"
  name = "aks-hub1"
  parent_id = azapi_resource.fleet.id
  body = jsonencode({
    properties = {
      clusterResourceId = module.aks-east.aks_id
    }
  })
}

resource "azapi_resource" "aks-hub-2" {
  type = "Microsoft.ContainerService/fleets/members@2022-09-02-preview"
  name = "aks-hub2"
  parent_id = azapi_resource.fleet.id
  body = jsonencode({
    properties = {
      clusterResourceId = module.aks-west.aks_id
    }
  })
}