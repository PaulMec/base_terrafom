variable "location" {
  type        = string
  description = "Storage Account location."
}

variable "name" {
  type        = string
  description = "Storage Account name."
}

variable "queue-name" {
  type        = string
  description = "Storage Account Queue name."
}

variable "rg-name" {
  type        = string
  description = "Resource group name."
}

variable "account-tier" {
  type        = string
  description = "Account Tier."
}

variable "account-replication-type" {
  type        = string
  description = "Account Replication Type."
}
