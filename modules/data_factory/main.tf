resource "azurerm_data_factory" "my_data_factory" {
  name                        = var.data_factory_name
  location                    = var.location
  resource_group_name         = var.resource_group_name

  tags = {
      created      = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
      display_name = "Data Factory Resource Group"
    }

  lifecycle {
    ignore_changes = [
      tags["created"],
    ]
  }
}