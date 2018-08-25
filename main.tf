#############################################################
# AKS RESOURCES
#############################################################

resource "azurerm_kubernetes_cluster" "terraform-aks" {
  name       = "${var.cluster_name}"
  location   = "${var.location}"
  dns_prefix = "${var.dns_prefix}"

  resource_group_name = "${var.resource_group}"

  linux_profile {
    admin_username = "${var.admin_username}"

    ssh_key {
      key_data = "${var.ssh_key}"
    }
  }

  agent_pool_profile {
    name    = "${var.agent_pool_name}"
    count   = "${var.worker_nodes_nb}"
    vm_size = "${var.worker_nodes_size}"
    os_type = "${var.worker_nodes_os_types}"

    # Required for advanced networking
    vnet_subnet_id = "${var.aks_subnet_id}"
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  network_profile {
    network_plugin = "${var.network_profile}"
  }
}