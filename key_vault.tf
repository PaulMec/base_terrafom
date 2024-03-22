
# Manages a Key Vault Azure Cognitive Services Secret.
resource "azurerm_key_vault_secret" "insights-telemetry" {
  name         = "insights-telemetry-name"
  value        = "insights_telemetry_name"
  key_vault_id = "azurerm_key_vault.key_vault.id"
}