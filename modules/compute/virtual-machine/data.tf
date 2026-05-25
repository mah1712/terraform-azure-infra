data "azurerm_network_interface" "nic" {

  for_each = var.nic_data

  name                = each.value.nic_name

  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault" "kv" {

  for_each = var.keyvault_data

  name                = each.value.kv_name

  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "username" {

  for_each = var.username_secret

  name = each.value.secret_name

  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "password" {

  for_each = var.password_secret

  name = each.value.secret_name

  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

