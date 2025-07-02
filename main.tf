# azure terraform template for creating a resource group and a storage account
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "my_rg" {
  name     = var.resource_group_name
  location = var.location
}

module "storage_account" {
  source              = "./modules/storage_account"
  storage_account_name = var.storage_account_name
  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name
}

module "key_vault" {
  source              = "./modules/key_vault"
  key_vault_name      = var.key_vault_name
  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name
}

resource "null_resource" "run_container_script" {
  depends_on = [module.storage_account]

  provisioner "local-exec" {
    command = "powershell.exe -ExecutionPolicy Bypass -File script.ps1 -resourceGroup ${azurerm_resource_group.my_rg.name} -storageAccount ${module.storage_account.name}"
  }

  triggers = {
    storage_account_name = module.storage_account.name
  }
}

