variable "name" {
  type        = string
  description = "Container App Name."
}

variable "rg-name" {
  type        = string
  description = "Resource group name."
}

variable "container_app_environment_id" {
  type        = string
  description = "Container App Environment ID."
}

variable "container_name" {
  type        = string
  description = "Container Name."
}

variable "image" {
  type        = string
  description = "Container App Image."
}

variable "location" {
  type        = string
  description = "Log Analytics Workspace location."
}
