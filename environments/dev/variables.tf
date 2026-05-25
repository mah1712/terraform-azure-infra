variable "rg" {
  type = map(object({
    rg_name = string
    location = string
    rg_managed = optional (string)
  }))
}

variable "vnet" {
  type = map(object({
    vnet_name     = string
    location      = string
    rg_name       = string
    address_space = list(string)
  }))
}
variable "subnet" {
  type = map(object({
    subnet_name      = string
    rg_name          = string
    vnet_name        = string
    address_prefixes = list(string)
  }))
}
variable "nsg" {

  type = map(object({

    nsg_name = string
    location = string
    rg_name  = string

    security_rule = map(object({

      rule_name                  = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string

      source_port_range          = string
      destination_port_range     = string

      source_address_prefix      = string
      destination_address_prefix = string

    }))

  }))
}
variable "pip" {

  type = map(object({

    pip_name          = string
    location          = string
    rg_name           = string
    allocation_method = string
    sku               = string

  }))
}
variable "subnet_data" {

  type = map(object({

    data_name           = string
    vnet_name           = string
    resource_group_name = string

  }))
}

variable "nic" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string

    ip_configuration = map(object({

      ip_name                       = string
      private_ip_address_allocation = string

    }))

  }))
}
variable "keyvault" {

  type = map(object({

    kv_name  = string
    location = string
    rg_name  = string

    sku_name = string

  }))
}

variable "secret" {

  type = map(object({

    secret_name  = string
    secret_value = string

    kv_key = string

  }))
}

variable "nic_data" {

  type = map(object({

    nic_name = string

    rg_name = string

  }))
}

variable "keyvault_data" {

  type = map(object({

    kv_name = string

    rg_name = string

  }))
}

variable "username_secret" {

  type = map(object({

    secret_name = string

  }))
}

variable "password_secret" {

  type = map(object({

    secret_name = string

  }))
}

variable "vm" {

  type = map(object({

    vm_name = string

    identity_name = string

    location = string

    rg_name = string

    vm_size = string

    computer_name = string

    zone = string

  }))
}

variable "lb" {

  type = map(object({

    lb_name = string

    location = string

    rg_name = string

    sku = string

    frontend_name = string

    backend_pool_name = string

    probe_name = string

    probe_port = number

    rule_name = string

    frontend_port = number

    backend_port = number

    subnet_name = string

    vnet_name = string
  }))
}

variable "lb_nic_data" {

  type = map(object({

    nic_name = string

    rg_name = string

    ip_configuration_name = string
  }))
}

variable "nat_pip_data" {

  type = map(object({

    pip_name = string

    rg_name = string

  }))
}

variable "nat_subnet_data" {

  type = map(object({

    subnet_name = string

    vnet_name = string

    rg_name = string

  }))
}

variable "nat_gateway" {

  type = map(object({

    nat_name = string

    location = string

    rg_name = string

    sku_name = string

  }))
}

variable "storage_account" {

  type = map(object({

    storage_name = string

    rg_name = string

    location = string

    account_tier = string

    account_replication_type = string

    account_kind = string

  }))
}

variable "nsg_subnet_data" {

  type = map(object({

    subnet_name = string

    vnet_name = string

    rg_name = string

    nsg_name = string

  }))
}

variable "private_dns" {

  type = map(object({

    dns_zone_name = string

    dns_link_name = string

    rg_name = string

    vnet_name = string
  }))
}

variable "private_endpoint" {

  type = map(object({

    pe_name = string

    location = string

    rg_name = string

    subnet_name = string

    vnet_name = string

    kv_name = string

    psc_name = string

    dns_zone_name = string

    zone_group_name = string
  }))
}

variable "bastion" {

  type = map(object({

    bastion_name = string

    location = string

    rg_name = string

    subnet_name = string

    vnet_name = string

    pip_name = string

    ip_config_name = string

  }))
}

variable "firewall" {

  type = map(object({

    firewall_name = string

    location = string

    rg_name = string

    subnet_name = string

    vnet_name = string

    pip_name = string

    ip_config_name = string
  }))
}

variable "udr" {

  type = map(object({

    route_table_name = string

    location = string

    rg_name = string

    subnet_name = string

    vnet_name = string

    route_name = string

    firewall_name = string
  }))
}

variable "log_analytics" {

  type = map(object({

    workspace_name = string

    location = string

    rg_name = string

    retention_in_days = number
  }))
}

variable "alert" {

  type = map(object({

    vm_name = string

    rg_name = string

    action_group_name = string

    short_name = string

    email_address = string

    alert_name = string
  }))
}