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