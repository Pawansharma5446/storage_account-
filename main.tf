terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    features {}
    subscription_id = "61f220b6-5e66-44f2-a125-be948dad3988"
}

resource "azurerm_resource_group" "name" {
    name     = "rg-terraform"
    location = "eastus"
}

resource "azurerm_storage_account" "example" {
  depends_on = [ azurerm_resource_group.name ]
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.name.name
  location                 = azurerm_resource_group.name.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}


