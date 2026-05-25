resource "azurerm_storage_account" "storage" {

  for_each = var.storage_account

  name                = each.value.storage_name

  resource_group_name = each.value.rg_name

  location = each.value.location

  account_tier = each.value.account_tier

  account_replication_type = each.value.account_replication_type

  account_kind = each.value.account_kind

  # public_network_access_enabled = false

  # allow_nested_items_to_be_public = false

  # min_tls_version = "TLS1_2"
}