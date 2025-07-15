data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "my_vault" {
  # core parameters
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name                    = "standard"

  # important parameters
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization


  dynamic "contact" {
    for_each = var.contacts

    content {
      email = contact.value.email
      name  = contact.value.name
      phone = contact.value.phone
    }
  }

  dynamic "access_policy" {
    for_each = var.access_policies

    content {
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = access_policy.value.object_id
      application_id          = access_policy.value.application_id
      key_permissions         = access_policy.value.key_permissions
      secret_permissions      = access_policy.value.secret_permissions
      certificate_permissions = access_policy.value.certificate_permissions
      storage_permissions     = access_policy.value.storage_permissions
    }
  }
}

resource "azurerm_key_vault_key" "keys" {
  for_each        = { for key in var.keys : key.name => key }
  key_vault_id    = azurerm_key_vault.my_vault.id
  name            = each.value.name
  key_type        = each.value.key_type
  key_size        = each.value.key_size
  curve           = each.value.curve
  key_opts        = each.value.key_opts
  not_before_date = each.value.not_before_date
  expiration_date = each.value.expiration_date
}

resource "azurerm_key_vault_secret" "secrets" {
  for_each        = { for secret in var.secrets : secret.name => secret }
  key_vault_id    = azurerm_key_vault.my_vault.id
  name            = each.value.name
  value           = each.value.value
  content_type    = each.value.content_type
  not_before_date = each.value.not_before_date
  expiration_date = each.value.expiration_date
}