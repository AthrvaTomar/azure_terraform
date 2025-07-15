variable "location" {
  type        = string
  description = "Azure region where resources will be created"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
}
variable "data_factory_name" {
  type        = string
  description = "Name of the Azure Data Factory"
}
