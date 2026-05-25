data "azurerm_subnet" "subnet" {

  for_each = var.firewall

  name = each.value.subnet_name

  virtual_network_name = each.value.vnet_name

  resource_group_name = each.value.rg_name
}

data "azurerm_public_ip" "pip" {

  for_each = var.firewall

  name = each.value.pip_name

  resource_group_name = each.value.rg_name
}

resource "azurerm_firewall" "firewall" {

  for_each = var.firewall

  name = each.value.firewall_name

  location = each.value.location

  resource_group_name = each.value.rg_name

  sku_name = "AZFW_VNet"

  sku_tier = "Standard"

  ip_configuration {

    name = each.value.ip_config_name

    subnet_id = data.azurerm_subnet.subnet[each.key].id

    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_firewall_nat_rule_collection" "nat" {

  for_each = var.firewall

  name = "nat-rule"

  azure_firewall_name = azurerm_firewall.firewall[each.key].name

  resource_group_name = each.value.rg_name

  priority = 100

  action = "Dnat"

  rule {

    name = "http-rule"

    source_addresses = ["*"]

    destination_ports = ["80"]

    destination_addresses = [
      data.azurerm_public_ip.pip[each.key].ip_address
    ]

    translated_address = "10.0.1.10"

    translated_port = "80"

    protocols = ["TCP"]
  }
}