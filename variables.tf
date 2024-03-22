variable "location" {
  type        = string
  description = "Locacion de servicios"
}

variable "resource-group-name" {
  type        = string
  description = "Resource group location."
}

variable "storage-account-name" {
  type        = string
  description = "Storage Account name."
}

variable "storage-account-queue-name" {
  type        = string
  description = "Storage Account Queue name."
}

variable "storage-account-blob-name" {
  type        = string
  description = "Storage Account Blob name."
}

variable "storage-account-tier" {
  type        = string
  description = "Storage Account Account Tier."
}

variable "storage-account-replication-type" {
  type        = string
  description = "Storage Account Account Replication Type."
}


variable "l-a-ws-name" {
  type        = string
  description = "Log Analytics Workspace name."
}

variable "l-a-ws-sku" {
  type        = string
  description = "Defines the Log Analytics service level."
}

variable "l-a-ws-retention" {
  type        = number
  description = "Retention in days."
}

variable "c-app-env-name" {
  type        = string
  description = "Container App Environment name."
}

variable "job-name" {
  type        = string
  description = "Defines the Log Analytics service level."
}

variable "container_app_name" {
  type        = string
  description = "Container App Name."
}

variable "container_app_container_name" {
  type        = string
  description = "Container Name."
}

variable "container_app_image" {
  type        = string
  description = "Container App Image."
}

variable "container_apps_insights_telemetry_revision_mode" {
  description = "(Required) The revisions operational mode for the Container App."
  default     = "Single"
  type        = string
}

variable "container_apps_insights_telemetry_image" {
  description = "(Required) The image to use to create the container."
  default     = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
  type        = string
}


variable "container_apps_insights_telemetry_cpu" {
  description = "(Required) The amount of vCPU to allocate to the container."
  default     = 0.25
  type        = number
}

variable "container_apps_insights_telemetry_memory" {
  description = "(Required) The amount of vCPU to allocate to the container."
  default     = "0.5Gi"
  type        = string
}

variable "log_analytics_workspace_sku" {
  description = "(Optional) Specifies the SKU of the Log Analytics Workspace."
  default     = "PerGB2018"
  type        = string
}

variable "log_analytics_retention_in_days" {
  description = "(Optional) The workspace data retention in days."
  default     = 30
  type        = number
}

variable "account_tier" {
  description = "(Required) Defines the Tier to use for this storage account"
  default     = "Standard"
  type        = string
}

variable "account_replication_type" {
  description = "(Required) Defines the type of replication to use for this storage account"
  default     = "GRS"
  type        = string
}