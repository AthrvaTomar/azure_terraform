# core 

subscription_id = "873e2aca-1282-4991-b0bc-b22642160bce"
location = "North Europe"
resource_group_name = "my-first-rg"

# storage account

storage_account_name = "atsa123456"
account_kind = "StorageV2"
enable_hns = true
enable_sftp = false
enable_large_file_share = false
enable_blob_versioning = false
https_traffic_only_enabled = true
min_tls_version = "TLS1_2"
nfsv3_enabled = false
cross_tenant_replication_enabled = false
infrastructure_encryption_enabled = false
shared_access_key_enabled = true
public_network_access_enabled = true
default_to_oauth_authentication = false
last_access_time_enabled = true
delete_retention_days = 7
container_delete_retention_days = 7
ct_name_list = ["ct1", "ct2", "ct3"]

# key vault
key_vault_name = "at-kv-1"
enabled_for_deployment = true
enabled_for_disk_encryption = true
enabled_for_template_deployment = true
enable_rbac_authorization = true

# vnet

vnet_name = "at-vnet-1"
address_space = [ "10.0.0.0/16" ]
dns_servers = []
subnets = [
  {
    name             = "default"
    address_prefixes = [ "10.0.0.0/24" ]
    # security_group   = "my_nsg"
    }
]

# security group

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
    source_port_range                          = "22"
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
    source_port_range                          = "80"
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
    source_port_range                          = "80"
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
    source_port_range                          = "443"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_address_prefixes = ["*"]
    destination_port_ranges    = ["443"]
    description = "Allow outbound HTTPS traffic"
  }
]

# azure data factory

data_factory_name = "at-data-factory-1"

# data bricks

data_bricks_name = "at-data-bricks-1"
managed_resource_group_name = "at-data-bricks-managed-rg-1"