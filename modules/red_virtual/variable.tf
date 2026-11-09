variable "nombre_vnet" {
    type = string
    description = "Nombre de la red virtual (VNET)"     
}

variable "ubicacion"{
    type = string
    description = "Ubicación de la red virtual (VNET)"
}

variable "nombre_rg"{
    type = string
    description = "Nombre del grupo de recursos (RG) donde se creará la red virtual (VNET)" 
}

variable "espacio_direcciones"{
    type =list(string)
    description = "Bloque de direcciones CIDR para la red virtual (VNET)"
    default =["10.0.0.0/16"]

}