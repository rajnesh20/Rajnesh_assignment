variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "storage_account_name" {
  type = string

}
variable "virtual_network_name" {
  type = string

}
variable "address_space" {
  type = list(string)

}
variable "virtual_machine_name" {
  type = string

}
variable "vm_size" {
  type = string

}
variable "admin_username" {
  type = string

}
variable "admin_password" {
  type = string

}
variable "nic_name" {
  type = string

}
variable "subnet_id" {
  type = string

}
variable "subnet_name" {
  type = string

}
variable "address_prefixes" {
  type = list(string)

}
variable "service_endpoints" {
  type = list(string)

}
# variable "resource_group_name" {
#     type = string

# }
variable "nic_id" {

  type = string
}
variable "public_ip_name" {
  type = string
}
variable "allocation_method" {
  type = string

}

variable "key_vault_id" {
  type = string
}
# variable "kv" {
#   type = string

# }
variable "secret_name" {
  type = string
}
variable "sql_server_name" {
  type = string
}
variable "administrator_login" {
  type = string
}
variable "administrator_login_password" {
  type = string
}
# variable "virtual_machine_name" {
#   type = string

# }
# variable "vm_size" {
#   type = string

# }
variable "nic_interface_id" {
  type = string
}
variable "key_vault_name" {
  type = string

}
variable "network_interface_ids" {
  
}
variable "tenant_id" {
  type = string
}
