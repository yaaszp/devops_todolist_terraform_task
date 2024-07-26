resource "azurerm_storage_account" "storage-account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "todoapp-container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage-account.name
  container_access_type = "container"
}

resource "azurerm_storage_blob" "todoapp-blob" {
  name                   = "${var.container_name}_blob"
  storage_account_name   = azurerm_storage_account.storage-account.name
  storage_container_name = azurerm_storage_container.todoapp-container.name
  type                   = "Block"
  source                 = "D:\\Terraform\\devops_todolist_terraform_task\\install-app.sh"
}

