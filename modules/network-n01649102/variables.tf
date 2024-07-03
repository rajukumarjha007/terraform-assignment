variable "network_rg_name" {}

variable "location" {}

variable "virtual_network_name" {
  default = "n01649102-VNET"
}

variable "virtual_network_address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  default = "n01649102-SUBNET"
}

variable "subnet_address" {
  default = ["10.0.0.0/24"]
}

variable "network_security_group_name" {
  default = "n01649102-NSG"
}

variable "common_tags" {}
