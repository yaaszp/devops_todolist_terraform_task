terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }

  # In order to create remote backend, resources like storage_account, container, resource group must be created.
  # For the first start need to use local backend
  # backend "azurerm" {
  #   storage_account_name = "yaasappstorageaccount"
  #   container_name       = "tfstate"
  #   key                  = "terraform.tfstate"
  #   resource_group_name  = "mate-azure-task-12"
  # }
}

provider "azurerm" {
  features {}
}

module "storage" {
  source                  = "./modules/storage"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  storage_account_name    = var.storage_account_name
  container_name          = var.container_name
}

module "network" {
  source                = "./modules/network"
  rg_name               = module.storage.rg_name
  rg_location           = module.storage.rg_location
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
  rg_name        = module.storage.rg_name
  rg_location    = module.storage.rg_location
  blob_url       = module.storage.blob_url
  vm_name        = var.vm_name
  extension_name = var.extension_name
  vm_size        = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password
  key_data       = var.key_data
}

