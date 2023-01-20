include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "git::https://github.com/akashmishra24/repo1-tfmodules.git//azurerm_vm"
}

inputs = {
  resource_group_name  = "rg-iac-cox-poc-01"
  location             = "East US 2"
  virtual_network_name = "rg-iac-cox-poc-01-vnet"
  subnet_name          = "gitrunner-subnet"
  }
