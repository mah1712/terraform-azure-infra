output "nsg_association" {

  value = [
    for association in azurerm_subnet_network_security_group_association.association : association.id
  ]
}