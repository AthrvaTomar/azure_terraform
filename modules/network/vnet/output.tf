output "vnet_name" {
  value = azurerm_virtual_network.my_vnet.name
}

output "vnet_id" {
  value = azurerm_virtual_network.my_vnet.id
}

output "vnet_location" {
  value = azurerm_virtual_network.my_vnet.location
}

output "vnet_resource_group_name" {
  value = azurerm_virtual_network.my_vnet.resource_group_name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.my_vnet.address_space
}

output "vnet_dns_servers" {
  value = azurerm_virtual_network.my_vnet.dns_servers
}

output "vnet_subnets" {
  value = {
    for subnet in azurerm_virtual_network.my_vnet.subnet : subnet.name => {
      id                = subnet.id
      address_prefixes = subnet.address_prefixes
      security_group   = subnet.security_group
    }
  }
}
