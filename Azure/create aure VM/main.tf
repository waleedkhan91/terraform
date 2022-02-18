#Create the AzureRM Provider in Terraform
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

# Define the Azure Resource Group
resource   "azurerm_resource_group"   "rg"   { 
   name   =   "wk-openshift-rg" 
   location   =   "westus2" 
}
# Define a Virtual Network and Subnet
resource   "azurerm_virtual_network"   "myvnet"   { 
   name   =   "my-vnet" 
   address_space   =   [ "10.0.0.0/16" ] 
   location   =   "westus2" 
   resource_group_name   =   azurerm_resource_group.rg.name 
} 
resource   "azurerm_subnet"   "frontendsubnet"   { 
   name   =   "frontendSubnet" 
   resource_group_name   =    azurerm_resource_group.rg.name 
   virtual_network_name   =   azurerm_virtual_network.myvnet.name 
   address_prefix   =   "10.0.1.0/24" 
}
# Define a New Public IP Address
resource   "azurerm_public_ip"   "myvm1publicip"   { 
   name   =   "pip1" 
   location   =   "westus2" 
   resource_group_name   =   azurerm_resource_group.rg.name 
   allocation_method   =   "Dynamic" 
   sku   =   "Basic" 
} 
# Define a Network Interface for our VM
resource   "azurerm_network_interface"   "myvm1nic"   { 
   name   =   "myvm1-nic" 
   location   =   "westus2" 
   resource_group_name   =   azurerm_resource_group.rg.name 

   ip_configuration   { 
     name   =   "ipconfig1" 
     subnet_id   =   azurerm_subnet.frontendsubnet.id 
     private_ip_address_allocation   =   "Dynamic" 
     public_ip_address_id   =   azurerm_public_ip.myvm1publicip.id 
   } 
}
# Define the Virtual Machine CentOS 7.5
resource "azurerm_linux_virtual_machine" "main" {
    name                  = "myvm1"
    location              = "westus2"
    resource_group_name   = azurerm_resource_group.rg.name
    network_interface_ids = [azurerm_network_interface.myvm1nic.id]
    size                  = "Standard_D4_v3"
    #size                  = "Standard_DS3_v2"

    os_disk {
        name              = "myvm1OSdisk"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "OpenLogic"
        offer     = "CentOS"
        sku       = "7.5"
        version   = "latest"
    }

    computer_name  = "myvm1"
    admin_username = "adminuser"
    admin_password = "admin@123"
    disable_password_authentication = false

    tags = {
        environment = "UnixArena Terraform Demo"
    }
}  
