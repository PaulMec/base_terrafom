variable "location" {
  type        = string
  description = "Log Analytics Workspace location."
}

variable "name" {
  type        = string
  description = "Log Analytics Workspace name."
}

variable "rg-name" {
  type        = string
  description = "Resource group name."
}

variable "sku" {
  type        = string
  description = "Defines the Log Analytics service level."
}

variable "retention-in-days" {
  type        = number
  description = "Retention in days."
}
