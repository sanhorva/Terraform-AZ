resource "azurerm_network_security_group" "sg-s" {
  name                = "sg-s"
  location            = var.rg_location
  resource_group_name = var.rg_name
}

resource "azurerm_virtual_network" "vn-s" {
  name                = "vn-s"
  location            = var.rg_location
  resource_group_name = var.rg_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "subnet" {
    for_each = var.subnets
    resource_group_name = var.rg_name
    virtual_network_name = azurerm_virtual_network.vn-s.name
    name = each.value["name"]
    address_prefixes = each.value["address_prefixes"]  
}

resource "azurerm_public_ip" "bastion_pubip" {
    name = "bastion_pubip"
    location = var.rg_location
    resource_group_name = var.rg_name
    allocation_method = "Static"
    sku = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  name                = "bastion"
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.subnet["bastion_subnet"].id
    public_ip_address_id = azurerm_public_ip.bastion_pubip.id
  }
}