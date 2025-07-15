# varibles for core parameters
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


# variable for important parameters
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


#complex variables for contacts, key-value and access policies
variable "access_policies" {
  type = list(object({
    object_id               = string
    application_id          = optional(string)
    key_permissions         = optional(list(string), [])
    secret_permissions      = optional(list(string), [])
    certificate_permissions = optional(list(string), [])
    storage_permissions     = optional(list(string), [])
  }))
  default     = [
    {
      object_id          = "00000000-0000-0000-0000-000000000000" # Replace with a real object_id
      key_permissions    = ["Get", "Create", "List"]
      secret_permissions = ["Get", "List", "Set", "Delete"]
      certificate_permissions = ["Get", "List"]
      storage_permissions = ["Get", "List"]
    },
    {
      object_id          = "11111111-1111-1111-1111-111111111111" # Replace with a real object_id
      key_permissions    = ["Get", "Create"]
      secret_permissions = ["Get", "List"]
      certificate_permissions = ["Get"]
      storage_permissions = ["Get"]
    }
  ]
  description = "List of objects that represent the configuration of each access policies."
}

variable "keys" {
  type = list(object({
    name            = string
    key_type        = string
    key_size        = optional(number)
    curve           = optional(string)
    key_opts        = optional(list(string), [])
    not_before_date = optional(string)
    expiration_date = optional(string)
  }))
  default     = []
  description = "List of objects that represent the configuration of each key."
}

variable "secrets" {
  type = list(object({
    name            = string
    value           = string
    content_type    = optional(string)
    not_before_date = optional(string)
    expiration_date = optional(string)
  }))
  default     = []
  description = "List of objects that represent the configuration of each secrect."
}

variable "contacts" {
  type = list(object({
    email = string
    name  = optional(string)
    phone = optional(string)
  }))
  default     = []
  description = "List of objects that represent each contact."
}