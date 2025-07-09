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

output "container_names" {
  description = "List of container names created in the storage account"
  value       = module.storage_account.container_names
}

output "key_vault_name" {
  description = "Key Vault name from the module"
  value       = module.key_vault.key_vault_name
}

output "key_vault_uri" {
  description = "URI to access the Key Vault"
  value       = module.key_vault.key_vault_uri
}

output "key_vault_id" {
  description = "Resource ID of the Azure Key Vault"
  value       = module.key_vault.key_vault_id
}

output "vnet_name" {
  value = module.vnet.vnet_name
}

output "vnet_id" {
  value = module.vnet.vnet_id
}

output "vnet_location" {
  value = module.vnet.vnet_location
}

output "vnet_resource_group_name" {
  value = module.vnet.vnet_resource_group_name
}

output "vnet_address_space" {
  value = module.vnet.vnet_address_space
}

output "vnet_dns_servers" {
  value = module.vnet.vnet_dns_servers
}

output "vnet_subnets" {
  value = {
    for subnet in module.vnet.vnet_subnets : subnet.name => {
      id                = subnet.id
      address_prefixes = subnet.address_prefixes
      security_group   = subnet.security_group
    }
  }
}

output "nsg_id" {
  value       = module.security_group.nsg_id
  description = "The network security group configuration ID."
}

output "nsg_name" {
  value       = module.security_group.nsg_name
  description = "The name of the network security group."
}

output "nsg_tags" {
  value       = module.security_group.nsg_tags
  description = "The tags assigned to the resource."
}

output "nsg_inbound_rules" {
  value       = { for rule in module.security_group.nsg_inbound_rules : rule.name => rule }
  description = "Blocks containing configuration of each inbound security rule."
}

output "nsg_outbound_rules" {
  value       = { for rule in module.security_group.nsg_outbound_rules : rule.name => rule }
  description = "Blocks containing configuration of each outbound security rule."
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
