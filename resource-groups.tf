resource "azurerm_resource_group" "this" {
    name     = "fleet_west"
    location = var.location_one
}

resource "azurerm_resource_group" "rg-fleet" {
    name     = "fleet_east"
    location = var.location_two
}