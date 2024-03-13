output "stg_name" {
  value = module.StorageAccount.out.name
}

output "rg_name" {
  value = azurerm_resource_group.rg-sanhorva.name
}
