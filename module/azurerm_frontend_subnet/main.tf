resource "azurerm_subnet" "todo_app_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes

#   delegation {
#     name = "example-delegation"

    # service_delegation {
    #   name    = "Microsoft.Web/serverFarms"
    #   actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    # }
  }

#   service_endpoints = var.service_endpoints

# }