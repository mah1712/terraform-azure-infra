data "azurerm_public_ip" "pip" {

  for_each = var.nat_pip_data

  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

data "azurerm_subnet" "subnet" {

  for_each = var.nat_subnet_data

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

resource "azurerm_nat_gateway" "nat" {

  for_each = var.nat_gateway

  name                = each.value.nat_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  sku_name = each.value.sku_name
}

resource "azurerm_nat_gateway_public_ip_association" "association" {

  for_each = var.nat_gateway

  nat_gateway_id       = azurerm_nat_gateway.nat[each.key].id
  public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
}

resource "azurerm_subnet_nat_gateway_association" "subnet_association" {

  for_each = var.nat_subnet_data

  subnet_id      = data.azurerm_subnet.subnet[each.key].id
  nat_gateway_id = azurerm_nat_gateway.nat["nat1"].id
}