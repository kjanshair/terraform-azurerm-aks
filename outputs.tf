#############################################################
# AKS OUTPUT
#############################################################

output "subnet_id" {
    description = "Subnet ID."
    value = "${azurerm_kubernetes_cluster.terraform-aks.agent_pool_profile.0.vnet_subnet_id}"
}

output "network_plugin" {
    description = "Network Pluging used for AKS."
    value = "${azurerm_kubernetes_cluster.terraform-aks.network_profile.0.network_plugin}"
}

output "service_cidr" {
    description = "AKS Service CIDR."
    value = "${azurerm_kubernetes_cluster.terraform-aks.network_profile.0.service_cidr}"
}

output "dns_service_ip" {
    description = "DNS Service IP."
    value = "${azurerm_kubernetes_cluster.terraform-aks.network_profile.0.dns_service_ip}"
}

output "kube_config" {
    description = "Kubernetes configuration file for K8s clients."
    value = "${azurerm_kubernetes_cluster.terraform-aks.kube_config_raw}"
}