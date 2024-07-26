terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "storage" {
  source                  = "./modules/storage"
  resource_group_name     = azurerm_resource_group.rg.name
  resource_group_location = azurerm_resource_group.rg.location
  storage_account_name    = var.storage_account_name
  container_name          = var.container_name
}

module "network" {
  source                = "./modules/network"
  rg_name               = azurerm_resource_group.rg.name
  rg_location           = azurerm_resource_group.rg.location
  security_group_name   = var.security_group_name
  vnet_name             = var.vnet_name
  subnet_name           = var.subnet_name
  public_ip_name        = var.public_ip_name
  domain_name_label     = var.domain_name_label
  vnet_address          = var.vnet_address
  subnet_address_prefix = var.subnet_address_prefix
}

module "compute" {
  source         = "./modules/compute"
  subnet_id      = module.network.subnet_id
  rg_name        = azurerm_resource_group.rg.name
  rg_location    = azurerm_resource_group.rg.location
  blob_url       = module.storage.blob_url
  vm_name        = var.vm_name
  extension_name = var.extension_name
  vm_size        = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password
  key_data       = var.key_data
  public_ip_id   = module.network.public_ip_id
}

