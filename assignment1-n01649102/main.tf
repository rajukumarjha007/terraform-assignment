module "rgroup-n01649102" {
  source = "../modules/rgroup-n01649102"

  network_rg_name = "n01649102-RG"
  location        = "Canada Central"
  common_tags     = var.common_tags
}

module "network-n01649102" {
  source = "../modules/network-n01649102"

  network_rg_name               = module.rgroup-n01649102.network_rg
  location                      = module.rgroup-n01649102.location
  virtual_network_name          = "n01649102-VNET"
  virtual_network_address_space = ["10.0.0.0/16"]
  subnet_name                   = "n01649102-SUBNET"
  subnet_address                = ["10.0.0.0/24"]
  network_security_group_name   = "n01649102-NSG"
  common_tags                   = var.common_tags
}

module "common-n01649102" {
  source = "../modules/common-n01649102"

  location                     = module.rgroup-n01649102.location
  network_rg_name              = module.rgroup-n01649102.network_rg
  log_analytics_workspace_name = "n01649102-log-analytics-workspace"
  recovery_services_vault_name = "n01649102-recovery-service-vault"
  storage_account_name         = "rjn01649102sa"
  common_tags                  = var.common_tags
}

module "vmlinux-n01649102" {
  source = "../modules/vmlinux-n01649102"

  linux_name = { "rjn01649102-linux-vm1" : "Standard_B1ms",
    "rjn01649102-linux-vm2" : "Standard_B1ms",
  "rjn01649102-linux-vm3" : "Standard_B1ms" }
  vm_size                      = "Standard_B1ms"
  admin_username               = "rajukumar07"
  public_key_path              = "C:/Users/rajuk/terraform_key.pub"
  private_key_path             = "C:/Users/rajuk/terraform_key"
  os_disk_storage_account_type = "Standard_LRS"
  os_disk_size                 = 32
  os_disk_caching              = "ReadWrite"
  os_publisher                 = "OpenLogic"
  os_offer                     = "CentOS"
  os_sku                       = "8_2"
  os_version                   = "latest"
  linux_avs                    = "n01649102-linux-avs"
  location                     = module.rgroup-n01649102.location
  network_rg_name              = module.rgroup-n01649102.network_rg
  subnet_id                    = module.network-n01649102.subnet_id
  storage_account_uri          = module.common-n01649102.storage_account_uri
  common_tags                  = var.common_tags
}

module "vmwindows-n01649102" {
  source = "../modules/vmwindows-n01649102"

  windows_admin_username               = "rajukumar07"
  windows_admin_password               = "Password@123"
  windows_os_disk_storage_account_type = "StandardSSD_LRS"
  windows_os_disk_size                 = 128
  windows_os_disk_caching              = "ReadWrite"
  windows_os_publisher                 = "MicrosoftWindowsServer"
  windows_os_offer                     = "WindowsServer"
  windows_os_sku                       = "2016-Datacenter"
  windows_os_version                   = "latest"
  windows_avs                          = "n01649102-windows-avs"
  windows_name                         = "n01649102-w-vm"
  windows_size                         = "Standard_B1ms"
  network_rg_name                      = module.rgroup-n01649102.network_rg
  location                             = module.rgroup-n01649102.location
  subnet_id                            = module.network-n01649102.subnet_id
  nb_count                             = 1
  common_tags                          = var.common_tags
}

module "datadisk-n01649102" {
  source = "../modules/datadisk-n01649102"

  vm_ids          = concat(module.vmlinux-n01649102.linux_id, module.vmwindows-n01649102.windows_id)
  network_rg_name = module.rgroup-n01649102.network_rg
  location        = module.rgroup-n01649102.location
  common_tags     = var.common_tags
}

module "loadbalancer-n01649102" {
  source = "../modules/loadbalancer-n01649102"

  linux_vm_ids   = module.vmlinux-n01649102.linux_id
  linux_nic_ids  = module.vmlinux-n01649102.linux_nic_id
  linux_hostname = module.vmlinux-n01649102.linux_hostname
  resource_group = module.rgroup-n01649102.network_rg
  location       = module.rgroup-n01649102.location
  common_tags    = var.common_tags
}

module "database-n01649102" {
  source = "../modules/database-n01649102"

  network_rg_name = module.rgroup-n01649102.network_rg
  location        = module.rgroup-n01649102.location
  server_name     = "n01649102-postgresql-server"
  admin_username  = "psqladmin"
  admin_password  = "n01649102@sql"
  database_name   = "n01649102-database"
  common_tags     = var.common_tags
}
