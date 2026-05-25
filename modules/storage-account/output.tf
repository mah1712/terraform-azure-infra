output "storage_account_name" {

  value = [
    for storage in azurerm_storage_account.storage : storage.name
  ]
}