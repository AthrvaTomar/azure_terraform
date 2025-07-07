variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  default     = "76e93b34-efea-4502-a7f4-096d7801fdac"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be created"
  default     = "East US"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
  default     = "my-first-rg"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the Azure Storage Account (must be globally unique, 3-24 lowercase letters and numbers)"
  default     = "atsa123456"  
}

variable "key_vault_name" {
  type        = string
  description = "Name of the Azure Key Vault"
  default     = "myuniquekeyvault123"
}

variable "data_factory_name" {
  type        = string
  description = "Name of the Azure Data Factory"
  default = "at-df-1"
}

variable "data_bricks_name" {
  type        = string
  description = "Name of the Azure Data Bricks Workspace"
  default     = "at-db-1"
}