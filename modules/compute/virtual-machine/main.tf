resource "azurerm_user_assigned_identity" "identity" {

  for_each = var.vm

  name = each.value.identity_name

  location = each.value.location

  resource_group_name = each.value.rg_name
}

resource "azurerm_linux_virtual_machine" "vm" {

  for_each = var.vm

  name = each.value.vm_name

  location = each.value.location

  resource_group_name = each.value.rg_name

  size = each.value.vm_size

  admin_username = data.azurerm_key_vault_secret.username[each.key].value

  admin_password = data.azurerm_key_vault_secret.password[each.key].value

  disable_password_authentication = false

  network_interface_ids = [
    data.azurerm_network_interface.nic[each.key].id
  ]

  # zone = each.value.zone

  identity {

    type = "UserAssigned"

    identity_ids = [
      azurerm_user_assigned_identity.identity[each.key].id
    ]
  }

  os_disk {

    caching = "ReadWrite"

    storage_account_type = "Standard_LRS"
  }

  source_image_reference {

    publisher = "Canonical"

    offer = "0001-com-ubuntu-server-jammy"

    sku = "22_04-lts"

    version = "latest"
  }

  computer_name = each.value.computer_name
}

resource "azurerm_role_assignment" "kv_role" {

  for_each = var.vm

  scope = data.azurerm_key_vault.kv[each.key].id

  role_definition_name = "Key Vault Secrets User"

  principal_id = azurerm_user_assigned_identity.identity[each.key].principal_id
}