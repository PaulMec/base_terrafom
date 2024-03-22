resource "azurerm_container_app_job" "container_app_job" {
  name                     = var.name
  resource_group_name      = var.rg-name
  environment_name         = var.environment_name
  trigger_type             = "Event"
  replica_timeout          = 1800
  replica_retry_limit      = 0
  replica_completion_count = 1
  parallelism              = 1

  container_spec {
    image  = "docker.io/myuser/my-event-driven-job:latest"
    cpu    = "0.25"
    memory = "0.5Gi"
  }

  scale_settings {
    min_executions = 0
    max_executions = 10
    scale_rule {
      name = "queue"
      type = "azure-queue"
      metadata = {
        accountName = var.storage-account-name
        queueName   = var.storage-account-queue-name
        queueLength = 1
      }
      auth {
        connection = "connection-string-secret"
      }
    }
  }

  secrets {
    connection_string_secret = var.storage_account_connection_string
  }
}

