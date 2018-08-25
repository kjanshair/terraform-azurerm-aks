#############################################################
# AKS VARIABLES
#############################################################

# Global Configuration

variable "location" {
    description = "Specify a region of AKS."
    default = "Southeast Asia"
}

variable "resource_group" {
    description = "Specify resource group of AKS cluster."
}

# Cluster Info

variable "dns_prefix" {
    description = "Specify a DNS prefix."  
    default = "aks-demo"
}

variable "cluster_name" {
    description = "Specify Cluster Name."
    default = "aks-demo"
}

variable "admin_username" {
    description = "Specify a Linux Admin UserName."  
    default = "aksuser"
}

variable "ssh_key" {
    description = "Specify public SSH key for AKS cluster." 
}

# Worker Nodes Info

variable "agent_pool_name" {
  description = "Kubernetes Agent Pool Name."
  default = "agentpool"
}

variable "worker_nodes_nb" {
  description = "Specify number of worker nodes for AKS."
  default = 2
}

variable "worker_nodes_size" {
  description = "Specify sizes of worker nodes for AKS."
  default = "Standard_DS2_v2"
}

variable "worker_nodes_os_types" {
  description = "Specify OS Types for worker nodes."
  default = "Linux"
}

# Networking

variable "aks_subnet_id" {
  description = "Specify Subnet ID for AKS worloads."
}

variable "network_profile" {
  description = "Specify network profile for AKS."
  default = "azure"
}


# Azure Credentials

variable "client_id" {
  description = "Specify client_id."
}

variable "client_secret" {
  description = "Specify client_secret."
}
