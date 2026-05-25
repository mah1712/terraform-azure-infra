data "azurerm_subnet" "subnet" {

  for_each = var.lb

  name = each.value.subnet_name

  virtual_network_name = each.value.vnet_name

  resource_group_name = each.value.rg_name
}

data "azurerm_network_interface" "nic" {

  for_each = var.lb_nic_data

  name = each.value.nic_name

  resource_group_name = each.value.rg_name
}

resource "azurerm_lb" "lb" {

  for_each = var.lb

  name = each.value.lb_name

  location = each.value.location

  resource_group_name = each.value.rg_name

  sku = each.value.sku

  frontend_ip_configuration {

    name = each.value.frontend_name

    subnet_id = data.azurerm_subnet.subnet[each.key].id

    private_ip_address = "10.0.1.10"

    private_ip_address_allocation = "Static"
  }
}

resource "azurerm_lb_backend_address_pool" "backend" {

  for_each = var.lb

  loadbalancer_id = azurerm_lb.lb[each.key].id

  name = each.value.backend_pool_name
}

resource "azurerm_lb_probe" "probe" {

  for_each = var.lb

  loadbalancer_id = azurerm_lb.lb[each.key].id

  name = each.value.probe_name

  protocol = "Tcp"

  port = each.value.probe_port
}

resource "azurerm_lb_rule" "rule" {

  for_each = var.lb

  loadbalancer_id = azurerm_lb.lb[each.key].id

  name = each.value.rule_name

  protocol = "Tcp"

  frontend_port = each.value.frontend_port

  backend_port = each.value.backend_port

  frontend_ip_configuration_name = each.value.frontend_name

  backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.backend[each.key].id
  ]

  probe_id = azurerm_lb_probe.probe[each.key].id
}

resource "azurerm_network_interface_backend_address_pool_association" "association" {

  for_each = var.lb_nic_data

  network_interface_id = data.azurerm_network_interface.nic[each.key].id

  ip_configuration_name = each.value.ip_configuration_name

  backend_address_pool_id = azurerm_lb_backend_address_pool.backend["lb1"].id
}