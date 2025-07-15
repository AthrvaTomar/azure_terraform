output "data_factory_name" {
  description = "Name of the Azure Data Factory"
  value       = azurerm_data_factory.my_data_factory.name
}

output "data_factory_id" {
  description = "Resource ID of the Azure Data Factory"
  value       = azurerm_data_factory.my_data_factory.id
}

output "data_factory_web_url" {
  description = "Web URL of the Azure Data Factory"
  value       = "https://adf.azure.com/environments/${azurerm_data_factory.my_data_factory.id}"
}
