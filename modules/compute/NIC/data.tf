data "azurerm_subnet" "subnet" {

  for_each = var.subnet_data

  name                 = each.value.data_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}
