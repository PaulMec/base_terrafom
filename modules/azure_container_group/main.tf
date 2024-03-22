resource "azurerm_container_group" "container_group" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg-name
  os_type             = "Linux"

  container {
    name   = var.container_name
    image  = var.image
    cpu    = "0.5"
    memory = "1.5"
    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  tags = {
    environment = var.container_app_environment_id
  }
}