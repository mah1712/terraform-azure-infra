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