output "lb_name" {

  value = {

    for k,v in azurerm_lb.lb : k => v.name
  }
}