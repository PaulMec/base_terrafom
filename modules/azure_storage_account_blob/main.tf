resource "azurerm_storage_account" "storage_account" {
  name                     = var.name
  resource_group_name      = var.rg-name
  location                 = var.location
  account_tier             = var.account-tier
  account_replication_type = var.account-replication-type
}

resource "azurerm_storage_container" "blob_container" {
  name                  = var.blob_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}
