resource "azurerm_databricks_workspace" "my_databricks" {
  name                        = var.data_bricks_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  managed_resource_group_name = var.managed_resource_group_name
  sku                         = "premium"

  }
  