output "vnet_name" {
  value = [
    for vnet in azurerm_virtual_network.vnet : vnet.name
  ]
}