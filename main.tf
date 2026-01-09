data "azuread_group" "this" {
  count = length(var.ad_groups)

  display_name = trimspace(var.ad_groups[count.index])
}

data "azurerm_resource_group" "this" {
  count = var.resource_group_create ? 0 : 1

  name = var.resource_group_name
}

resource "azurerm_resource_group" "this" {
  count = var.resource_group_create ? 1 : 0

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_role_assignment" "this" {
  count = var.resource_group_create ? length(data.azuread_group.this) : 0

  principal_id         = data.azuread_group.this[count.index].object_id
  role_definition_name = var.role_definition_name
  scope                = azurerm_resource_group.this[0].id

  depends_on = [azurerm_resource_group.this]
}

resource "azurerm_management_lock" "this" {
  count = var.resource_group_create && var.management_lock_create ? 1 : 0

  name       = "delete-lock"
  scope      = azurerm_resource_group.this[0].id
  lock_level = "CanNotDelete"

  depends_on = [azurerm_resource_group.this]
}
