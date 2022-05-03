# Configure the Azure Provider
#provider "azurerm" 
#ARM_SKIP_PROVIDER_REGISTRATION = "false"
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
#version = "=2.40.0"
# features {}
#}

#provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
 #  features {}
#}

provider "azurerm" {
  skip_provider_registration = true
features {}
}

resource "azurerm_resource_group" "demo"{
name = "demo-1"
location = var.Location
}
