variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "address_space" {
  description = "Address space of the virtual network"
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "List of subnet address prefixes"
  type        = list(string)
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
}

variable "location" {
  description = "Location/region where the resources should be created"
  type        = string
}