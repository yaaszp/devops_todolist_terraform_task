resource "azurerm_network_interface" "network_interface" {
  name                = "${var.vm_name}-nic"
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  size                = var.vm_size
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.key_data)
  }

  os_disk {
    name                 = "${var.vm_name}_os_disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}

resource "azurerm_virtual_machine_extension" "custom_script" {
  name                 = var.extension_name
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
      "fileUris": ["${var.blob_url}"],
      "commandToExecute": "./install-app.sh"
    }
SETTINGS
}
