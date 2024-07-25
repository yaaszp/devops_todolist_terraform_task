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

variable "rg_name" {
  type        = string
  description = "Resource group Name"
}

variable "rg_location" {
  type        = string
  description = "Resource group Location"
}

variable "domain_name_label" {
  type        = string
  description = "Domain name label"
}

variable "vnet_address" {
  type        = string
  description = "Vnet address space"
}

variable "subnet_address_prefix" {
  type        = string
  description = "Subnet address prefix"
}

