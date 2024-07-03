variable "network_rg_name" {}

variable "location" {}

variable "server_name" {
  default = "n01649102-database-server"
}

variable "admin_username" {
  default = "admin"
}

variable "admin_password" {
  default = "admin"
}

variable "database_name" {
  default = "n01649102-database"
}

variable "common_tags" {}
