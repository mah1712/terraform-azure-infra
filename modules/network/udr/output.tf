output "route_table_name" {

  value = [
    for rt in azurerm_route_table.udr : rt.name
  ]
}