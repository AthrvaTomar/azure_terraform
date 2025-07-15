output "data_bricks_name" {
    description = "The name of the Azure Databricks Workspace"
    value       = azurerm_databricks_workspace.my_databricks.name
}

output "workspace_url" {
    description = "The URL of the Azure Databricks Workspace"
    value       = azurerm_databricks_workspace.my_databricks.workspace_url
}
