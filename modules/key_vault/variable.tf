variable "location" {
  type        = string
  description = "Azure region where resources will be created"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
}

variable "key_vault_name" {
  type        = string
  description = "Name of the Azure Key Vault"
}