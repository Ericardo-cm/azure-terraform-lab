resource "azurerm_virtual_network" "vnet"{
    name = var.nombre_vnet
    location = var.ubicacion
    resource_group_name = var.nombre_rg
    address_space = var.espacio_direcciones
}

resource "azurerm_subnet" "subnet_ia"{
    name = "snet-ia-workloads"
    resource_group_name = var.nombre_rg
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = ["10.0.1.0/24"]
}