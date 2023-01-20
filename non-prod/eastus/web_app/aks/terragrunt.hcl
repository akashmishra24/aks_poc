include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "git::https://github.com/akashmishra24/repo1-tfmodules.git//aks"
}

inputs = {
  resource_group_name  = "rg-iac-cox-poc-01"
  location             = "East US 2"
  virtual_network_name = "rg-iac-cox-poc-01-vnet"
  subnet_name          = "gitrunner-subnet"
  name                     = "poc-aks-cluster"
  dns_prefix               = "akscluster"
  node_resource_group_name = "rg-iac-cox-poc-01"

  kubernetes_version = "1.17.11"
  sku_tier           = "Free"

  api_server_authorized_ip_ranges = [10.2.0.0/16]

  default_node_pool_vm_size        = "Standard_DS2_v2"
  default_node_pool_node_count     = 1
# default_node_pool_vnet_subnet_id = "/subnet/id"

  // If this block is not defined, Azure will create an identity for the cluster
#   service_principal = {
#     client_id     = "xxxxxxxxxxxxxxxxxxxxxxxx"
#     client_secret = "xxxxxxxxxxxxxxxxxxxxxxxx"
#   }

  // If this block is not defined, kubenet is the default plugin
  network_profile = {
    plugin             = "azure"
    policy             = "azure"
    dns_service_ip     = "8.8.8.8"
    service_cidr       = "10.254.0.0/16"
    docker_bridge_cidr = "172.17.0.1/16"
    outbound_type      = "loadBalancer"
    egress_ip_count    = 1
  }

  enable_kube_dashboard = false

  // If true, will create a log analytic workspace in the cluster resource group
  enable_oms_agent      = false
  tags = {}
}
  }
