locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "rajukumar.jha"
    ExpirationData = "2024-12-31"
    Environment    = "Learning"
  }
}

variable "linux_name" {}

variable "vm_size" {
  default = "Standard_DS1_v2"
}

variable "admin_username" {
  default = "rajukumar07"
}

variable "public_key_path" {
  default = "C:/Users/rajuk/terraform_key.pub"
}

variable "private_key_path" {
  default = "C:/Users/rajuk/terraform_key"
}

variable "os_disk_storage_account_type" {
  default = "Standard_LRS"
}

variable "os_disk_size" {
  default = 32
}

variable "os_disk_caching" {
  default = "ReadWrite"
}

variable "os_publisher" {
  default = "OpenLogic"
}

variable "os_offer" {
  default = "CentOS"
}

variable "os_sku" {
  default = "8_2"
}

variable "os_version" {
  default = "latest"
}

variable "linux_avs" {
  default = "n01649102-linux-avs"
}

variable "network_rg_name" {}

variable "location" {}

variable "subnet_id" {}

variable "storage_account_uri" {}

variable "common_tags" {}
