
terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

resource "random_string" "random" {
  length = 6
  special = false
  upper = false

  
}

resource "azurerm_storage_account" "sa-sanyi" {
  name                     =  "${lower(var.sa_name)}${random_string.random.result}"
  resource_group_name      = var.rg_name
  location                 = var.rg_location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}