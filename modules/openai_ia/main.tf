resource "azurerm_cognitive_account" "openai" {
  name                  = var.nombre_openai
  location              = var.ubicacion
  resource_group_name   = var.nombre_rg
  kind                  = "OpenAI"
  sku_name              = "S0"
  local_auth_enabled    = true
  # CLAVE PARA PRIVATE ENDPOINTS:
  custom_subdomain_name = var.nombre_openai # Define el subdominio privado (oai-lab-dev-01)
}

resource "azurerm_cognitive_deployment" "deployment" {
  name                 = var.nombre_modelo
  cognitive_account_id = azurerm_cognitive_account.openai.id

  model {
    format  = "OpenAI"
    name    = var.nombre_modelo
    version = "2025-08-07" # Versión de despliegue estándar que utilizamos en laboratorios previos
  }

  scale {
    type     = "GlobalStandard"
    capacity = 3
  }
}