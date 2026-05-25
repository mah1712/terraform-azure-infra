output "nsg_name" {
  value = [
    for nsg in azurerm_network_security_group.nsg : nsg.name
  ]
}