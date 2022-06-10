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
