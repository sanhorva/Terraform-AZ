output "stg_name" {
  value = module.StorageAccount.out.name
}

output "rg_name" {
  value = azurerm_resource_group.rg-sanhorva.name
}

output "azure_subnet_id" {
  value = module.subnet.azure_subnet_id
}

output "bastion_pubip" {
  value = module.subnet.bastion_pubip
}