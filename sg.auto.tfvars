nsg_name = "at-nsg-1"
nsg_tags = {
  "owner" = "athrva"
}
inbound_rules = [
  {
    name                       = "AllowSSH"
    priority                   = 100
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_ranges                         = []
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    source_address_prefixes    = ["*"]
    destination_port_ranges    = ["22"]
    description = "Allow SSH traffic"
  },
  {
    name                       = "AllowHTTP"
    priority                   = 200
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_ranges                         = []
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    source_address_prefixes    = ["*"]
    destination_port_ranges    = ["80"]
    description = "Allow HTTP traffic"
  }
]
outbound_rules = [
  {
    name                       = "AllowOutboundHTTP"
    priority                   = 100
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_ranges                         = []
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_address_prefixes = ["*"]
    destination_port_ranges    = ["80"]
    description = "Allow outbound HTTP traffic"
  },
  {
    name                       = "AllowOutboundHTTPS"
    priority                   = 200
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_ranges                         = []
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_address_prefixes = ["*"]
    destination_port_ranges    = ["443"]
    description = "Allow outbound HTTPS traffic"
  }
]
