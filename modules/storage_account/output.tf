output "name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.At-Sa-1.name
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint of the storage account"
  value       = azurerm_storage_account.At-Sa-1.primary_blob_endpoint
}

output "container_names" {
  description = "List of container names created in the storage account"
  value       = [for container in azurerm_storage_container.my_container : container.name]
}