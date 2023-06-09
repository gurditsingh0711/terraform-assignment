
resource "azurerm_managed_disk" "data_disk" {
  count                = var.vm_count
  name                 = "datadisk-${count.index}"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = var.account_type
  create_option        = "Empty"
  disk_size_gb         = var.datadisk_size
}


resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_linux" {
  count          = 2
  managed_disk_id = element(azurerm_managed_disk.data_disk.*.id, count.index)
  virtual_machine_id = element(var.linux_vm_ids, count.index)
  lun               = count.index
  caching           = "None"
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_windows" {
  managed_disk_id = azurerm_managed_disk.data_disk[2].id
  virtual_machine_id = var.vmwindows_vm_id
  lun               = 0
  caching           = "None"
}
