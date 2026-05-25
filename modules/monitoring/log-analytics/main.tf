resource "azurerm_log_analytics_workspace" "log" {

  for_each = var.log_analytics

  name = each.value.workspace_name

  location = each.value.location

  resource_group_name = each.value.rg_name

  sku = "PerGB2018"

  retention_in_days = each.value.retention_in_days
}