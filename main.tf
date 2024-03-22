locals {
  insights_telemetry_name              = "003"
  logs_diagnostic_workspace_name       = "001"
}
module "resource_group" {
  source   = "./modules/azure_resource_group"
  location = var.location
  name     = var.resource-group-name
}

module "storage_account" {
  depends_on               = [module.resource_group]
  source                   = "./modules/azure_storage_account_blob"
  name                     = var.storage-account-name
  location                 = var.location
  rg-name                  = module.resource_group.resource_group_name
  account-tier             = var.storage-account-tier
  account-replication-type = var.storage-account-replication-type
  blob_name                = var.storage-account-blob-name
}

module "log_analytics_workspace" {
  depends_on        = [module.resource_group]
  source            = "./modules/azure_log_analytics_workspace"
  name              = var.l-a-ws-name
  location          = var.location
  rg-name           = module.resource_group.resource_group_name
  sku               = var.l-a-ws-sku
  retention-in-days = var.l-a-ws-retention
}

module "container_app_environment" {
  depends_on = [module.resource_group, module.log_analytics_workspace, module.storage_account]
  source     = "./modules/azure_container_app_environment"
  name       = var.c-app-env-name
  location   = var.location
  rg-name    = module.resource_group.resource_group_name
  l-a-ws-id  = module.log_analytics_workspace.log_analytics_ws_id
}

module "container_app" {
  depends_on                     = [module.container_app_environment]
  source                         = "./modules/azure_container_app_coman"
  container_app_environment_name = module.container_app_environment.container_app_environment_name
  container_name                 = var.container_app_container_name
  image                          = var.container_app_image
  location                       = var.location
  name                           = var.container_app_name
  rg-name                        = var.resource-group-name
}


resource "azurerm_container_app" "insights_telemetry" {
  name                         = "insights_telemetry_namea"
  resource_group_name          = var.container_app_name
  container_app_environment_id = azurerm_container_app_environment.container_app_environment.id
  revision_mode                = var.container_apps_insights_telemetry_revision_mode
  tags                         = data.azurerm_resource_group.rg.tags
   identity {
    type         = "SystemAssigned, UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.container_apps_managed_identity.id]
  }
  registry {
    server   = azurerm_container_registry.container_registry.login_server
    identity = azurerm_user_assigned_identity.container_apps_managed_identity.id
  }
  secret {
    name  = "insights-telemetry"
    value = azurerm_key_vault_secret.insights-telemetry.value
  }
 template {
    container {
      name   = "telemetry"
      image  = var.container_apps_insights_telemetry_image
      cpu    = var.container_apps_insights_telemetry_cpu
      memory = var.container_apps_insights_telemetry_memory
    }
  }
  ingress {
    external_enabled = var.container_apps_ingress_external_enabled
    target_port      = var.container_apps_ingress_target_port
    traffic_weight {
      latest_revision = var.container_apps_ingress_traffic_weight_latest_revision
      percentage      = var.container_apps_ingress_traffic_weight_percentage
    }
  }

}

resource "azurerm_log_analytics_workspace" "logs_diagnostic_workspace" {
  name                     = var.l-a-ws-name
  location                 = var.location
  resource_group_name      = var.container_app_name
  sku                      = var.log_analytics_workspace_sku
  retention_in_days        = var.log_analytics_retention_in_days
}

resource "azurerm_storage_account" "storage_telemetry" {
  name                     = var.storage-account-name
  resource_group_name      = var.container_app_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

