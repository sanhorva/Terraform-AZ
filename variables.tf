# Subnet Vars
variable "subname" {
  type        = string
  description = "The name of the existing subnet"
}

variable "vnetname" {
  type        = string
  description = "The name of the existing vnet"
}

variable "vnetrg" {
  type        = string
  description = "The name of the VNet Resource Group"
}

#VMVare
variable "adminpw" {
  type        = string
  sensitive   = true
  description = "the local admin password, must be 12 char or longer"
}

variable "rgname" {
  type = string
  description = "the name of the resource group for the server"
}

variable "location" {
  type = string
  description = "the location for the deployment"
}


variable "vmname" {
  type = string
  description = "the name of the VM"
}

variable "size" {}
variable "locadmin" {}