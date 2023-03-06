resource "azurerm_resource_group" "demo_resource" {
  location = var.azure_location
  name     = "ferminoresourcegroup"
  tags     = local.default_tags
}

resource "azurerm_storage_account" "demo_storage_account" {
  name                     = "ferminostorageaccount"
  resource_group_name      = azurerm_resource_group.demo_resource.name
  location                 = var.azure_location
  account_tier             = var.azure_acc_tier
  account_replication_type = var.azure_acc_repl

  tags = local.default_tags
}

resource "azurerm_storage_container" "demo_storage_container" {
  name                 = "ferminostoragecontainer"
  storage_account_name = azurerm_storage_account.demo_storage_account.name
}