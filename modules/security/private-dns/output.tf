output "private_dns_zone_name" {

  value = {
    for k, v in azurerm_private_dns_zone.dns : k => v.name
  }
}
