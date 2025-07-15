vnet_name = "at-vnet-1"
address_space = [ "10.0.0.1/24" ]
dns_servers = []
subnets = [
  {
    name             = "default"
    address_prefixes = [ "10.0.2.0/24" ]
    security_group   = "my_nsg"
    }
]