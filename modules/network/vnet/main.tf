resource "azurerm_virtual_network" "my_vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  flow_timeout_in_minutes = 30
}

resource "azurerm_subnet" "my_subnets" {
  for_each             = { for subnet in var.subnets : subnet.name => subnet }
  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.my_vnet.name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assoc" {
  for_each = {
    for subnet in var.subnets : subnet.name => subnet
    if try(subnet.network_security_group_id, null) != null
  }
  subnet_id                 = azurerm_subnet.my_subnets[each.key].id
  network_security_group_id = each.value.network_security_group_id
}
