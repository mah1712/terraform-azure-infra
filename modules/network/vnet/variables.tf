variable "vnet" {
  type = map(object({
    vnet_name     = string
    location      = string
    rg_name       = string
    address_space = list(string)
  }))
}

variable "tags" {
  type = map(string)
}