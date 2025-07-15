output "key_vault_name" {
  description = "The name of the Azure Key Vault"
  value       = azurerm_key_vault.my_vault.name
}

output "key_vault_uri" {
  description = "The URI of the Azure Key Vault"
  value       = azurerm_key_vault.my_vault.vault_uri
}

output "key_vault_id" {
  description = "The resource ID of the Azure Key Vault"
  value       = azurerm_key_vault.my_vault.id
}