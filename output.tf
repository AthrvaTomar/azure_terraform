output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.my_rg.name
}

output "resource_group_location" {
  description = "The Azure region where the resource group is created"
  value       = azurerm_resource_group.my_rg.location
}

output "storage_account_name" {
  description = "Storage Account name from the module"
  value       = module.storage_account.name
}

output "storage_account_primary_endpoint" {
  description = "Primary endpoint for blob access"
  value       = module.storage_account.primary_blob_endpoint
}

output "key_vault_name" {
  description = "Key Vault name from the module"
  value       = module.key_vault.key_vault_name
}

output "key_vault_uri" {
  description = "URI to access the Key Vault"
  value       = module.key_vault.key_vault_uri
}

output "data_factory_name" {
  description = "Name of the Azure Data Factory"
  value       = module.data_factory.data_factory_name
}

output "data_factory_id" {
  description = "Resource ID of the Azure Data Factory"
  value       = module.data_factory.data_factory_id
}

output "data_factory_web_url" {
  description = "Web URL of the Azure Data Factory"
  value       = module.data_factory.data_factory_web_url
}

output "data_bricks_name" {
    description = "The name of the Azure Databricks Workspace"
    value       = module.data_bricks.data_bricks_name
}
output "workspace_url" {
    description = "The URL of the Azure Databricks Workspace"
    value       = module.data_bricks.workspace_url
}
