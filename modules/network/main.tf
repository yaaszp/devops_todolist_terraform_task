resource "random_integer" "dns_label" {
  min = 1000
  max = 9999
}

resource "azurerm_network_security_group" "sg" {
  name                = var.security_group_name
  location            = var.rg_location
  resource_group_name = var.rg_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  address_space       = [var.vnet_address]
}

resource "azurerm_subnet" "internal" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.domain_name_label}${random_integer.dns_label.result}"
}