output "nic_name" {

  value = [
    for nic in azurerm_network_interface.nic : nic.name
  ]
}