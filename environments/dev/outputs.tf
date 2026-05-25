output "rg_name" {
  value = module.rg.rg_name
}

output "vnet_name" {
  value = module.vnet.vnet_name
}

output "subnet_name" {
  value = module.subnet.subnet_name
}
output "nsg_name" {
  value = module.nsg.nsg_name
}
output "pip_name" {
  value = module.pip.pip_name
}
output "nic_name" {
  value = module.nic.nic_name
}
output "keyvault_name" {
  value = module.keyvault.keyvault_name
}
output "vm_name" {
  value = module.vm.vm_name
}
output "managed_identity_name" {
  value = module.vm.managed_identity_name
}
output "lb_name" {
  value = module.lb.lb_name
}
output "nat_gateway_name" {
  value = module.nat_gateway.nat_gateway_name
}
output "nsg_association" {
  value = module.nsg_association.nsg_association
}
output "private_dns_zone_name" {

  value = module.private_dns.private_dns_zone_name
}
output "private_endpoint_name" {

  value = module.private_endpoint.private_endpoint_name
}
output "bastion_name" {
  value = module.bastion.bastion_name
}
output "firewall_name" {
  value = module.firewall.firewall_name
}
output "route_table_name" {
  value = module.udr.route_table_name
}
output "workspace_name" {
  value = module.log_analytics.workspace_name
}
output "alert_name" {
  value = module.alert.alert_name
}