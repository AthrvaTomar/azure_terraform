variable "vnet_name" {
  description = "value of the virtual network name"
  type        = string
}

variable "location" {
  description = "Location where the virtual network will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the virtual network will be created"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "dns_servers" {
  description = "List of DNS servers for the virtual network"
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "List of subnets to be created within the virtual network"
  type = list(object({
    name             = string
    address_prefixes = list(string)
    network_security_group_id   = optional(string)
  }))
}

