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