module "resource_group_name" {
  source              = "../module/azurerm_resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}
module "network_interface_ids" {
  source              = "../module/azurerm_nic_interface"
  depends_on          = [var.resource_group_name, module.subnet]
  nic_name            = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
}
module "storage_account_name" {
  source               = "../module/azurerm_storage_account"
  depends_on           = [var.resource_group_name]
  storage_account_name = var.storage_account_name
  location             = var.location
  resource_group_name  = var.resource_group_name
}
module "virtual_network" {
  source               = "../module/azurerm_virtual_network"
  depends_on           = [var.resource_group_name]
  virtual_network_name = var.virtual_network_name
  address_space        = var.address_space
  location             = var.location
  resource_group_name  = var.resource_group_name
}
module "subnet" {
  source               = "../module/azurerm_frontend_subnet"
  depends_on           = [module.virtual_network]
  subnet_name          = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
  service_endpoints    = var.service_endpoints
}


module "virtual_machine" {
  source = "../module/virtual_machine"
  depends_on           = [module.virtual_network, module.resource_group_name,  module.subnet, module.network_interface_ids, ]
  virtual_machine_name = var.virtual_machine_name
  vm_size              = var.vm_size
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  location             = var.location
  resource_group_name  = var.resource_group_name
  # nic_id               = var.nic_id
network_interface_ids = var.network_interface_ids
}

module "public_ip" {
  source              = "../module/public_ip"
  depends_on          = [module.resource_group_name]
  public_ip_name      = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
}
module "sql_server" {
  source                       = "../module/sql_server"
  depends_on                   = [var.resource_group_name]
  sql_server_name              = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}