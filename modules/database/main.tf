
resource "azurerm_postgresql_server" "database" {
  name                         = "${var.prefix}-database"
  location                     = var.location
  resource_group_name          = var.rg_name
  version                      = "10.0"
  administrator_login          = var.db_admin_username
  administrator_login_password = var.db_admin_password
  sku_name                     = var.db_sku_name
  storage_mb                   = var.db_storage_mb
  ssl_enforcement_enabled      = true
  tags                         = var.tags
}

