terraform{
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "=2.46.0"
        }
    }
}

#Configure the microsoft azure provider.
provider "azurerm"{
    features {}
}

#Create a resource group
resource "azurerm_resource_group" "example" {
    name = "example-rg"
    location = "West Europe"
}
