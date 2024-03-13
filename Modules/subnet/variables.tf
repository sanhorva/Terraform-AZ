
variable "rg_location" {
    type = string
    description = "The location for the deployment"
}

variable "rg_name" {
  type = string
  description = "name of the rg"
}
variable "address_space" {}
variable "dns_servers" {}

variable "subnets" {
    type = map(any)
    default = {
      subnet6 = {
        name = "subnet6"
        address_prefixes = ["20.0.1.0/24"]
      }
      subnet7 = {
        name = "subnet7"
        address_prefixes = ["20.0.2.0/24"]
      }
      bastion_subnet = {
        name = "AzureBastionSubnet"
        address_prefixes = ["20.0.3.0/24"]
      }      
    }
  
}

