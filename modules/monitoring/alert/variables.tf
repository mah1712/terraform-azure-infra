variable "alert" {

  type = map(object({

    vm_id = string

    rg_name = string

    action_group_name = string

    short_name = string

    email_address = string

    alert_name = string
  }))
}