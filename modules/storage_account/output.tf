output "name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.At-Sa-1.name
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint of the storage account"
  value       = azurerm_storage_account.At-Sa-1.primary_blob_endpoint
}
