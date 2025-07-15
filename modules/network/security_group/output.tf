output "nsg_id" {
  value       = azurerm_network_security_group.nsg.id
  description = "The network security group configuration ID."
}

output "nsg_name" {
  value       = azurerm_network_security_group.nsg.name
  description = "The name of the network security group."
}

output "nsg_tags" {
  value       = azurerm_network_security_group.nsg.tags
  description = "The tags assigned to the resource."
}

output "nsg_inbound_rules" {
  value       = { for rule in azurerm_network_security_rule.inbounds : rule.name => rule }
  description = "Blocks containing configuration of each inbound security rule."
}

output "nsg_outbound_rules" {
  value       = { for rule in azurerm_network_security_rule.outbounds : rule.name => rule }
  description = "Blocks containing configuration of each outbound security rule."
}