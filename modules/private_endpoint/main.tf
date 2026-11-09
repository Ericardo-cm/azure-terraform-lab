resource "azurerm_private_endpoint" "pe"{
    name =var.nombre_pe
    location =var.ubicacion
    resource_group_name = var.nombre_rg
    subnet_id =var.id_subred
    private_service_connection {
        name = "psc-openai-connection"
        private_connection_resource_id = var.id_cuenta_openai
        is_manual_connection = false
        subresource_names = ["account"]
    }
}