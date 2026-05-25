data "azurerm_subnet" "subnet" {

  for_each = var.private_endpoint

  name = each.value.subnet_name

  virtual_network_name = each.value.vnet_name

  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault" "kv" {

  for_each = var.private_endpoint

  name = each.value.kv_name

  resource_group_name = each.value.rg_name
}

data "azurerm_private_dns_zone" "dns" {

  for_each = var.private_endpoint

  name = each.value.dns_zone_name

  resource_group_name = each.value.rg_name
}

resource "azurerm_private_endpoint" "pe" {

  for_each = var.private_endpoint

  name = each.value.pe_name

  location = each.value.location

  resource_group_name = each.value.rg_name

  subnet_id = data.azurerm_subnet.subnet[each.key].id

  private_service_connection {

    name = each.value.psc_name

    private_connection_resource_id = data.azurerm_key_vault.kv[each.key].id

    subresource_names = ["vault"]

    is_manual_connection = false
  }

  private_dns_zone_group {

    name = each.value.zone_group_name

    private_dns_zone_ids = [
      data.azurerm_private_dns_zone.dns[each.key].id
    ]
  }
}