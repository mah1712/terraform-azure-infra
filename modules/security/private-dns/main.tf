data "azurerm_virtual_network" "vnet" {

  for_each = var.private_dns

  name = each.value.vnet_name

  resource_group_name = each.value.rg_name
}

resource "azurerm_private_dns_zone" "dns" {

  for_each = var.private_dns

  name = each.value.dns_zone_name

  resource_group_name = each.value.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {

  for_each = var.private_dns

  name = each.value.dns_link_name

  resource_group_name = each.value.rg_name

  private_dns_zone_name = azurerm_private_dns_zone.dns[each.key].name

  virtual_network_id = data.azurerm_virtual_network.vnet[each.key].id
}