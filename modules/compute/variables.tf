variable "vm_name" {
  type        = string
  description = "Virtual machine name"
}

variable "extension_name" {
  type        = string
  description = "Extension name"
}

variable "subnet_id" {
  type        = string
  description = "Subnet id"
}

variable "rg_name" {
  type        = string
  description = "Resource group Name"
}

variable "rg_location" {
  type        = string
  description = "Resource group Location"
}

variable "blob_url" {
  type        = string
  description = "Resource group Location"
}

variable "vm_size" {
  type        = string
  description = "VM size"
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