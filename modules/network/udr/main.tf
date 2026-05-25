data "azurerm_subnet" "subnet" {

  for_each = var.udr

  name = each.value.subnet_name

  virtual_network_name = each.value.vnet_name

  resource_group_name = each.value.rg_name
}

data "azurerm_firewall" "firewall" {

  for_each = var.udr

  name = each.value.firewall_name

  resource_group_name = each.value.rg_name
}

resource "azurerm_route_table" "udr" {

  for_each = var.udr

  name = each.value.route_table_name

  location = each.value.location

  resource_group_name = each.value.rg_name
}

resource "azurerm_route" "route" {

  for_each = var.udr

  name = each.value.route_name

  resource_group_name = each.value.rg_name

  route_table_name = azurerm_route_table.udr[each.key].name

  address_prefix = "0.0.0.0/0"

  next_hop_type = "VirtualAppliance"

  next_hop_in_ip_address = data.azurerm_firewall.firewall[each.key].ip_configuration[0].private_ip_address
}

resource "azurerm_subnet_route_table_association" "association" {

  for_each = var.udr

  subnet_id = data.azurerm_subnet.subnet[each.key].id

  route_table_id = azurerm_route_table.udr[each.key].id
}