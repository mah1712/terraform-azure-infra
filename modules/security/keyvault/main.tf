data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault" "kv" {

  for_each = var.keyvault

  name = each.value.kv_name

  location = each.value.location

  resource_group_name = each.value.rg_name

  tenant_id = data.azurerm_client_config.current.tenant_id

  sku_name = each.value.sku_name

  purge_protection_enabled = false

  soft_delete_retention_days = 7

  enabled_for_disk_encryption = true

  public_network_access_enabled = true

  access_policy {

    tenant_id = data.azurerm_client_config.current.tenant_id

    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "Set",
      "List",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}

resource "azurerm_key_vault_secret" "secret" {

  for_each = var.secret

  name = each.value.secret_name

  value = each.value.secret_value

  key_vault_id = azurerm_key_vault.kv[each.value.kv_key].id
}