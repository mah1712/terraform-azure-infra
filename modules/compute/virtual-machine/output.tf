output "vm_name" {

  value = [
    for vm in azurerm_linux_virtual_machine.vm : vm.name
  ]
}

output "vm_id" {

  value = {
    for k, v in azurerm_linux_virtual_machine.vm : k => v.id
  }
}

output "managed_identity_name" {

  value = [
    for identity in azurerm_user_assigned_identity.identity : identity.name
  ]
}

