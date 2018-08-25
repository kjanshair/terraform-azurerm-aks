# Create an Azure AKS (Azure Kubernetes Service) Cluster

Use this module to create a bare-metal managed AKS (Azure Kubernetes Service) cluster in Azure.

## Sample Usage

The example given below uses other Terraform modules available on the registry for brevity.

```
resource "azurerm_resource_group" "aks-rg" {
  name     = "AKS"
  location = "${var.location_name}"
}

module "AKSVNet" {
    source              = "Azure/network/azurerm"
    vnet_name           = "AKSVNet"
    resource_group_name = "${azurerm_resource_group.aks-rg.name}"
    location            = "${azurerm_resource_group.aks-rg.location}"
    address_space       = "192.168.0.0/24"  # Change CIDR to suite your needs
    subnet_prefixes     = ["192.168.0.0/24"]  # Change CIDR to suite your needs
    subnet_names        = ["default"]
}

module "AKSNSG" {
    source                     = "Azure/network-security-group/azurerm"
    resource_group_name        = "${azurerm_resource_group.aks-rg.name}"
    location                   = "${azurerm_resource_group.aks-rg.location}"
    security_group_name        = "NSG"
    predefined_rules           = [
      {
        name                   = "SSH"
        priority               = "500"
        source_address_prefix  = ["*"]
        source_port_range      = "*"
      },
      {
        name                   = "HTTP"
        priority               = "501"
        source_address_prefix  = ["*"]
        source_port_range      = "*"
      },
    ]
}

module "kjanshair-cluster" {
  source = "kjanshair/aks/azurerm"
  ssh_key = "<your-public-ssh-key>"
  client_id = "<azure-client-id>"
  client_secret = "<azure-client-secret>"
  aks_subnet_id = "${module.AKSVNet.vnet_subnets[0]}"
  resource_group  = "${azurerm_resource_group.aks-rg.name}"
}

```