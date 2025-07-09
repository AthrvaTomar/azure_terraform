# variable for core parameters
variable "location" {
  type        = string
  description = "Azure region where resources will be created"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the Azure Storage Account (must be globally unique, 3-24 lowercase letters and numbers)"
}

# variable for important parameters

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

variable "min_tls_version" {
  type        = string
  description = "Minimum TLS version for the storage account"
}

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