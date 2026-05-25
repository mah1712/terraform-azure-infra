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