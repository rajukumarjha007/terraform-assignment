variable "location" {}

variable "network_rg_name" {}

variable "log_analytics_workspace_name" {
  default = "n01649102-log-analytics-workspace"
}

variable "recovery_services_vault_name" {
  default = "n01649102-recovery-service-vault"
}

variable "storage_account_name" {
  default = "rjn01649102sa"
}

variable "common_tags" {}
