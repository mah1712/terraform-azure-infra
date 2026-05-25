output "firewall_name" {

  value = [
    for fw in azurerm_firewall.firewall : fw.name
  ]
}

