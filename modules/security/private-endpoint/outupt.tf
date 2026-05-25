output "private_endpoint_name" {

  value = [
    for pe in azurerm_private_endpoint.pe : pe.name
  ]
}