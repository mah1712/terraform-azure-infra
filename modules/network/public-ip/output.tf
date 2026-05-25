output "pip_name" {

  value = [
    for pip in azurerm_public_ip.pip : pip.name
  ]
}
output "pip_id" {

  value = {
    for k, v in azurerm_public_ip.pip : k => v.id
  }
}