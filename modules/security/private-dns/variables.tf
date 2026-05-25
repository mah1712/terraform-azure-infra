variable "private_dns" {

  type = map(object({

    dns_zone_name = string

    dns_link_name = string

    rg_name = string

    vnet_name = string
  }))
}