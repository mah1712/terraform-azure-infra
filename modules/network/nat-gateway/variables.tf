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