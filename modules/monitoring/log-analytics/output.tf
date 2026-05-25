output "workspace_id" {

  value = {
    for k, v in azurerm_log_analytics_workspace.log : k => v.id
  }
}

output "workspace_name" {

  value = [
    for log in azurerm_log_analytics_workspace.log : log.name
  ]
}