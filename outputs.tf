output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "resource_group_id" {
  value = module.resource_group.resource_group_id
}

output "storage_account_id" {
  value = module.storage_account.storage_account_id
}

output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "log_analytics_ws_name" {
  value = module.log_analytics_workspace.log_analytics_ws_name
}

output "log_analytics_ws_id" {
  value = module.log_analytics_workspace.log_analytics_ws_id
}

output "container_app_environment_name" {
  value = module.container_app_environment.container_app_environment_name
}

output "container_app_environment_id" {
  value = module.container_app_environment.container_app_environment_id
}

# Azure the id of the Analytics Workspace.
output "workspace_id" {
  value = "log_analytics_workspace"
}