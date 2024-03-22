resource "azurerm_log_analytics_workspace" "log_analytics_ws" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg-name
  sku                 = var.sku
  retention_in_days   = var.retention-in-days
}
