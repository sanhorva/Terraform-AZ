
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}


resource "azurerm_resource_group" "rg-sanhorva" {
  name     = "rg-sanhorva"
  location = "West Europe"
}

module "StorageAccount" {
  source      = "./Modules/StorageAccount"
  sa_name     = var.sa_name
  rg_location = var.rg_location
  rg_name     = var.rg_name

}

module "KeyVault" {
  source      = "./Modules/KeyVault"
  rg_location = var.rg_location
  rg_name     = var.rg_name

}

module "subnet" {
  source        = "./Modules/subnet"
  rg_location   = var.rg_location
  rg_name       = var.rg_name
  address_space = var.address_space
  dns_servers   = var.dns_servers
}