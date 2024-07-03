terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate_n01649102_RG"
    storage_account_name = "tfstaten01649102sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
    access_key           = ""
  }
}
