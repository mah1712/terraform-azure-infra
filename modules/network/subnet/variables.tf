variable "subnet" {
  type = map(object({
    subnet_name     = string
    rg_name         = string
    vnet_name       = string
    address_prefixes = list(string)
  }))
}