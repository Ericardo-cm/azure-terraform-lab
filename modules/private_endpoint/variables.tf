variable "nombre_pe"{
    type = string
    description = "nombre del Endpoint Privado (Private Endpoint) que se creará para la cuenta de OpenAI"
}

variable "ubicacion"{
    type =string
    description = "Region de Azure (debe coincidir con tu grupo de recursos, ej: eastus)"

}

variable "nombre_rg"{
    type =string
    description = "Nombre del Grupo de Recursos (RG) donde se creará el Endpoint Privado (Private Endpoint) para la cuenta de OpenAI"
}

variable "id_subred"{
    type =string
    description = "ID de la subred donde se conectacra el Private Endpoint (Private Endpoint) para la cuenta de OpenAI"
}

variable "id_cuenta_openai"{
    type =string
    description = "ID de la cuenta de OpenAI a la que se conectará el Private Endpoint (Private Endpoint)"
}