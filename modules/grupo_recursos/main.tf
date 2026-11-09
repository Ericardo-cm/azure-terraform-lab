resource "azurerm_resource_group" "rg" {
    name    = var.nombre_rg
    location = var.ubicacion
  
}

output "id_grupo_recursos" {
    value = azurerm_resource_group.rg.id
}