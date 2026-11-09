variable "nombre_openai" {
    type = string
    description = "Nombre de la cuenta de azure OpenAI services"

}

variable "ubicacion" {
    type = string
    description = "Región de Azure (debe coincidir con tu grupo de recursos, ej: eastus)"
}

variable "nombre_rg" {
    type = string
    description = "Nombre del grupo de recursos (RG) donde se creará la cuenta de Azure OpenAI services"
}

variable "nombre_modelo"{
    type = string
    description = "Nombre del modelo a desplegar (ej: gpt-35-turbo, gpt-4, etc.)   "
    default = "gpt-35-mini"

}