variable "location" {
  type        = string
  description = "Storage Account location."
}

variable "name" {
  type        = string
  description = "container App Job name."
}

variable "storage-account-name" {
  type        = string
  description = "Storage Account name."
}

variable "storage-account-queue-name" {
  type        = string
  description = "Storage Account Queue name."
}

variable "rg-name" {
  type        = string
  description = "Resource group name."
}

variable "storage_account_connection_string" {
  type        = string
  description = "Storage Account Connection String."
}
