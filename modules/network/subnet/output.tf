output "subnet_name" {
  value = [
    for subnet in azurerm_subnet.subnet : subnet.name
  ]
}
output "subnet_id" {

  value = {
    for k, v in azurerm_subnet.subnet : k => v.id
  }
}