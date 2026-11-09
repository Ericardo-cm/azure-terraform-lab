output "endpoint_openai" {
  value       = azurerm_cognitive_account.openai.endpoint
  description = "Endpoint HTTP de la API de Azure OpenAI"
}

output "id_openai" {
  value       = azurerm_cognitive_account.openai.id
  description = "ID único del recurso de OpenAI creado"
}