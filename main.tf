terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
provider "azurerm" {
  features {}
}

# 1. Grupo de Recursos (El cimiento que debe nacer primero)
module "mi_grupo_recursos" {
  source    = "./modules/grupo_recursos"
  nombre_rg = "rg-laboratorio-modular-dev"
  ubicacion = "eastus"
}

output "resultado_id_rg" {
  value = module.mi_grupo_recursos.id_grupo_recursos
}

# 2. Red Virtual (Le obligamos a esperar a que el Grupo de Recursos exista)
module "mi_red_virtual" {
  source              = "./modules/red_virtual"
  nombre_vnet         = "vnet-laboratorio-ia-dev"
  ubicacion           = "eastus"
  nombre_rg           = "rg-laboratorio-modular-dev"
  espacio_direcciones = ["10.0.0.0/16"]

  depends_on = [module.mi_grupo_recursos]
}

output "resultado_id_vnet" {
  value = module.mi_red_virtual.id_vnet
}

# 3. OpenAI (Le obligamos a esperar también al Grupo de Recursos)
module "mi_openai" {
  source        = "./modules/openai_ia"
  nombre_openai = "oai-lab-dev-01"
  ubicacion     = "eastus"
  nombre_rg     = "rg-laboratorio-modular-dev"
  nombre_modelo = "gpt-5-mini"

  depends_on = [module.mi_grupo_recursos]
}

output "resultado_endpoint_openai" {
  value = module.mi_openai.endpoint_openai
}

module "mi_private_endpoint"{
  source = "./modules/private_endpoint"
  nombre_pe = "pe-openai-lab-dev"
  ubicacion = "eastus"
  nombre_rg = "rg-laboratorio-modular-dev"
  id_subred = module.mi_red_virtual.id_subnet_ia
  id_cuenta_openai = module.mi_openai.id_openai

  depends_on = [module.mi_openai, module.mi_red_virtual]
}