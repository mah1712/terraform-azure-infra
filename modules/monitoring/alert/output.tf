output "alert_name" {

  value = [
    for alert in azurerm_monitor_metric_alert.cpu_alert : alert.name
  ]
}