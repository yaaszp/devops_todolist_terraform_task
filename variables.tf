variable "resource_group_name" {
  type        = string
  description = "Resource group Name"
}

variable "resource_group_location" {
  type        = string
  description = "Location for the resources"
}

variable "storage_account_name" {
  type        = string
  description = "Storage account Name"
}

variable "container_name" {
  type        = string
  description = "Container Name"
}

variable "security_group_name" {
  type        = string
  description = "Security group Name"
}

variable "vnet_name" {
  type        = string
  description = "Virtual_network Name"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
}

variable "public_ip_name" {
  type        = string
  description = "Public IP name"
}

variable "vm_name" {
  type        = string
  description = "Virtual machine name"
}

variable "extension_name" {
  type        = string
  description = "Extension name"
}

variable "domain_name_label" {
  type        = string
  description = "Domain name label"
}

variable "vm_size" {
  type        = string
  description = "VM size"
}

variable "vnet_address" {
  type        = string
  description = "Vnet address space"
}

variable "subnet_address_prefix" {
  type        = string
  description = "Subnet address prefix"
}

variable "admin_username" {
  type        = string
  description = "Subnet address prefix"
}

variable "admin_password" {
  type        = string
  description = "Subnet address prefix"
}

variable "key_data" {
  type        = string
  description = "Subnet address prefix"
}