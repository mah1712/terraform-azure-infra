output "nat_gateway_name" {

  value = [
    for nat in azurerm_nat_gateway.nat : nat.name
  ]
}