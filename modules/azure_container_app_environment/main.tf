resource "azurerm_container_app_environment" "container_app_environment" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.rg-name
  log_analytics_workspace_id = var.l-a-ws-id
}
