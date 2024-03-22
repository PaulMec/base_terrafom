resource "azurerm_storage_account" "storage_account" {
  name                     = var.name
  resource_group_name      = var.rg-name
  location                 = var.location
  account_tier             = var.account-tier
  account_replication_type = var.account-replication-type
}

resource "null_resource" "create_queue" {
  depends_on = [azurerm_storage_account.storage_account]

  provisioner "local-exec" {
    command = <<-EOT
      az storage queue create --name ${var.queue-name} --account-name ${azurerm_storage_account.storage_account.name} --account-key $(az storage account keys list --resource-group ${var.rg-name} --account-name ${azurerm_storage_account.storage_account.name} --query '[0].value' -o tsv)
    EOT
  }
}
