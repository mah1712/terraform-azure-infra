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