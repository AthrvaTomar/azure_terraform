# common variables for Azure resources
variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  type        = string
  description = "Azure region where resources will be created"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
}

# storage account variables

variable "storage_account_name" {
  type        = string
  description = "Name of the Azure Storage Account (must be globally unique, 3-24 lowercase letters and numbers)"
}

variable "account_kind" {
  description = "Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2"
  type        = string
}

variable "enable_hns" {
  type        = bool
  description = "Enable Hierarchical Namespace for the storage account"
}

variable "enable_sftp" {
  type        = bool
  description = "Enable SFTP for the storage account"
}

variable "enable_large_file_share" {
  type        = bool
  description = "Enable large file share for the storage account"
}

variable "enable_blob_versioning" {
  type        = bool
  description = "Enable blob encryption for the storage account"
}

variable "https_traffic_only_enabled" {
  type        = bool
  description = "Enable HTTPS traffic only for the storage account"
}

# tls - full form is Transport Layer Security
variable "min_tls_version" {
  type        = string
  description = "Minimum TLS version for the storage account"
}

# NFSv3 - Network File System version 3
# Cross-tenant replication is used to replicate data across different Azure Active Directory tenants
variable "nfsv3_enabled" {
  type        = bool
  description = "Enable NFSv3 for the storage account"
}

variable "cross_tenant_replication_enabled" {
  type        = bool
  description = "Enable cross-tenant replication for the storage account"
}

variable "infrastructure_encryption_enabled" {
  type        = bool
  description = "Enable infrastructure encryption for the storage account"
}

variable "shared_access_key_enabled" {
  type        = bool
  description = "Enable shared access key for the storage account"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Enable public network access for the storage account"
}

variable "default_to_oauth_authentication" {
  type        = bool
  description = "Enable default to OAuth authentication for the storage account"
}


variable "last_access_time_enabled" {
  type        = bool
  description = "Enable last access time tracking for the storage account"
}

variable "delete_retention_days" {
  type        = number
  description = "Number of days to retain deleted blobs"
}

variable "container_delete_retention_days" {
  type        = number
  description = "Number of days to retain deleted containers"
}

variable "ct_name_list" {
  type        = list(string)
  description = "List of container names to be created in the storage account"
}

# key vault variables
variable "key_vault_name" {
  type        = string
  description = "Name of the Azure Key Vault"
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
}

variable "enable_rbac_authorization" {
  type        = bool
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions."
}

# network variables

# virtual network variables
variable "vnet_name" {
  description = "value of the virtual network name"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "dns_servers" {
  description = "List of DNS servers for the virtual network"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnets to be created within the virtual network"
  type = list(object({
    name             = string
    address_prefixes = list(string)
    security_group   = optional(string)
  }))
}

# network security group variables

variable "nsg_name" {
  type        = string
  description = "The name of the network security group."
}

variable "nsg_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}

variable "inbound_rules" {
  type = list(object({
    name                                       = string
    priority                                   = number
    access                                     = string
    protocol                                   = string
    source_address_prefixes                    = optional(list(string))
    source_application_security_group_ids      = optional(list(string))
    source_port_range                          = optional(string)
    destination_address_prefixes               = optional(list(string))
    destination_application_security_group_ids = optional(list(string))
    destination_port_ranges                    = optional(list(string))
    description                                = optional(string)
  }))
  description = "List of objects that represent the configuration of each inbound rule."
}

variable "outbound_rules" {
  type = list(object({
    name                                       = string
    priority                                   = number
    access                                     = string
    protocol                                   = string
    source_address_prefixes                    = optional(list(string))
    source_application_security_group_ids      = optional(list(string))
    source_port_range                          = optional(string)
    destination_address_prefixes               = optional(list(string))
    destination_application_security_group_ids = optional(list(string))
    destination_port_ranges                    = optional(list(string))
    description                                = optional(string)
  }))
  description = "List of objects that represent the configuration of each outbound rule."
}

# data factory variables
variable "data_factory_name" {
  type        = string
  description = "Name of the Azure Data Factory"
}

# data bricks variables
variable "data_bricks_name" {
  type        = string
  description = "Name of the Azure Data Bricks Workspace"
}
variable "managed_resource_group_name" {
  type        = string
  description = "Name of the managed group resource"
}