# azure terraform template for creating a resource group and a storage account
resource "azurerm_resource_group" "my_rg" {
  name     = var.resource_group_name
  location = var.location
}

module "storage_account" {
  source              = "./modules/storage_account"
  storage_account_name = var.storage_account_name
  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name
  account_kind        = var.account_kind
  enable_hns          = var.enable_hns  
  enable_sftp         = var.enable_sftp
  enable_large_file_share = var.enable_large_file_share
  enable_blob_versioning = var.enable_blob_versioning
  https_traffic_only_enabled = var.https_traffic_only_enabled
  min_tls_version     = var.min_tls_version
  nfsv3_enabled       = var.nfsv3_enabled
  cross_tenant_replication_enabled = var.cross_tenant_replication_enabled
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  shared_access_key_enabled = var.shared_access_key_enabled
  public_network_access_enabled = var.public_network_access_enabled
  default_to_oauth_authentication = var.default_to_oauth_authentication
  last_access_time_enabled = var.last_access_time_enabled
  delete_retention_days = var.delete_retention_days 
  container_delete_retention_days = var.container_delete_retention_days
  ct_name_list         = var.ct_name_list

  depends_on = [ azurerm_resource_group.my_rg ]
}

module "key_vault" {
  source                          = "./modules/key_vault"
  key_vault_name                  = var.key_vault_name
  location                        = azurerm_resource_group.my_rg.location
  resource_group_name             = azurerm_resource_group.my_rg.name
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization

  depends_on = [ azurerm_resource_group.my_rg ]
}

# module "vnet" {
#   source              = "./modules/network/vnet"
#   vnet_name           = var.vnet_name
#   location            = azurerm_resource_group.my_rg.location
#   resource_group_name = azurerm_resource_group.my_rg.name
#   address_space       = var.address_space
#   dns_servers         = var.dns_servers
#   subnets             = var.subnets

#   depends_on = [ azurerm_resource_group.my_rg ]
# }

# module "security_group" {
#   source              = "./modules/network/security_group"
#   nsg_name            = var.nsg_name
#   location            = azurerm_resource_group.my_rg.location
#   resource_group_name = azurerm_resource_group.my_rg.name
#   nsg_tags            = var.nsg_tags
#   inbound_rules       = var.inbound_rules
#   outbound_rules      = var.outbound_rules

#   depends_on = [ azurerm_resource_group.my_rg ]
# }

module "data_factory" {
  source              = "./modules/data_factory"
  data_factory_name   = var.data_factory_name
  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name

  depends_on = [ azurerm_resource_group.my_rg ]
}

module "data_bricks" {
  source              = "./modules/data_bricks"
  data_bricks_name   = var.data_bricks_name
  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name
  managed_resource_group_name = var.managed_resource_group_name

  depends_on = [ azurerm_resource_group.my_rg ]
}

# resource "null_resource" "run_container_script" {
#   depends_on = [module.storage_account]

#   provisioner "local-exec" {
#     command = "powershell.exe -ExecutionPolicy Bypass -File script.ps1 -resourceGroup ${azurerm_resource_group.my_rg.name} -storageAccount ${module.storage_account.name}"
#   }

#   triggers = {
#     storage_account_name = module.storage_account.name
#   }
# }

