output "id_vnet" {
    value = azurerm_virtual_network.vnet.id
    description = "ID de la red virtual (VNET)"
  
}

output "id_subnet_ia"{
    value = azurerm_subnet.subnet_ia.id
    description = "ID de la subred dedicada a cargas de trabajo de IA"
}