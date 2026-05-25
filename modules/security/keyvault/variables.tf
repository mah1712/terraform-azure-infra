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