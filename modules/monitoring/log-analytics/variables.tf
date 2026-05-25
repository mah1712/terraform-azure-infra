variable "log_analytics" {

  type = map(object({

    workspace_name = string

    location = string

    rg_name = string

    retention_in_days = number
  }))
}