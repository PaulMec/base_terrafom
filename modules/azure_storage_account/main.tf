resource "azurerm_storage_account" "storage_account" {
  name                     = var.name
  resource_group_name      = var.rg-name
  location                 = var.location
  account_tier             = var.account-tier
  account_replication_type = var.account-replication-type
}
