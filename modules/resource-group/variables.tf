variable "rg" {
  type = map(object({
    rg_name = string
    location = string
    rg_managed = optional (string)
  }))
}

variable "tags" {
  type = map(string)
}