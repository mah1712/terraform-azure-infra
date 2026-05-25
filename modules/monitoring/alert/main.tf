resource "azurerm_monitor_action_group" "action" {

  for_each = var.alert

  name = each.value.action_group_name

  resource_group_name = each.value.rg_name

  short_name = each.value.short_name

  email_receiver {

    name = "admin"

    email_address = each.value.email_address
  }
}

resource "azurerm_monitor_metric_alert" "cpu_alert" {

  for_each = var.alert

  name = each.value.alert_name

  resource_group_name = each.value.rg_name

  scopes = [each.value.vm_id]

  description = "CPU usage alert"

  severity = 2

  frequency = "PT1M"

  window_size = "PT5M"

  criteria {

    metric_namespace = "Microsoft.Compute/virtualMachines"

    metric_name = "Percentage CPU"

    aggregation = "Average"

    operator = "GreaterThan"

    threshold = 80
  }

  action {

    action_group_id = azurerm_monitor_action_group.action[each.key].id
  }
}