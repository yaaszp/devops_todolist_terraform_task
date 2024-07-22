output "rg_name" {
  value = azurerm_resource_group.rg.name
}

output "rg_location" {
  value = azurerm_resource_group.rg.location
}

output "blob_url" {
  value = azurerm_storage_blob.todoapp-blob.url
}
