output "bastion_name" {

  value = [
    for bastion in azurerm_bastion_host.bastion : bastion.name
  ]
}
