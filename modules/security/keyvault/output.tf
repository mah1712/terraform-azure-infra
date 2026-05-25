output "keyvault_name" {

  value = [
    for kv in azurerm_key_vault.kv : kv.name
  ]
}

output "secret_name" {

  value = [
    for secret in azurerm_key_vault_secret.secret : secret.name
  ]
}