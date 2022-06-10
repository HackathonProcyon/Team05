//Backend Example.
terraform {
  backend "azurerm" {
    resource_group_name  = "rg_brazil"
    storage_account_name = "storage01t05"
    container_name       = "terraform"
    key                  = "+Ed47mCi8IOvcJ3qMO3VuA0dGTewsOU3vsjvjiRaJIKtyA18ZLrvodpiGKnoC/IxFTWzUyKAP4EG+AStQQOo1g=="    
  }
  required_providers {
    azurerm = {
      version = "~> 2.19"
    }
  }
}

//Provider example
provider "azurerm" {
  features {}
}



//RG
module "RGroups" {
  source = "./Modulos/RGroups"
  tupla_rgname_lc = var.tupla_rgname_lc
  }



//Log Analytics
module "LogAnalitycs" {
  source                = "./Modulos/LogAnalytics"
  name                  = "mshack"
  depends_on            = [module.RGroups] // Dependencia Explicita.
  resource_group_name   = join("," , module.RGroups.name[*].RGEU2001.name) // Dependencia implicita
  location              = join("," , module.RGroups.name[*].RGEU2001.location) // Dependencia implicita
  sku                   = "Free"
  retention_in_days     = 7
  //tags = merge(local.common_tags, local.extra_tags)
  tags="prueba"
  solutions = [
        {
            solution_name = "AzureActivity",
            publisher = "Microsoft",
            product = "OMSGallery/AzureActivity",
        },
    ]
}