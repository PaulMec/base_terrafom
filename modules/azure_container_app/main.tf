resource "azurerm_container_app" "container_app" {
  name                         = var.name
  container_app_environment_id = var.container_app_environment_id
  resource_group_name          = var.rg-name
  revision_mode                = "Single"

  template {
    container {
      name   = var.container_name
      image  = var.image
      cpu    = 0.25
      memory = "0.5Gi"
    }

    
  }
}