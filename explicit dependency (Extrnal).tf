terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.10.0"
    }
  }
}
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "vishal" {
  name     = "ramu2"
  location = "centralindia"
}
 

resource "azurerm_storage_account" "vishalstorage" {
  depends_on = [azurerm_resource_group.vishal]
  name                     = "rahulstorage2222"
  resource_group_name      = "ramu2"
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_virtual_network" "vishalvnet" {
  depends_on = [azurerm_resource_group.vishal]
  name                = "ramu2222"
  address_space       = ["10.0.0.0/16"]
  location            =  "centralindia"
  resource_group_name = "ramu2"
}

resource "azurerm_subnet" "vishalsubnet" {
  depends_on = [azurerm_virtual_network.vishalvnet]
  name                 = "ramu2323"
  resource_group_name  = "ramu2"
  virtual_network_name = "ramu2222"
  address_prefixes     = ["10.0.1.0/24"]
}
