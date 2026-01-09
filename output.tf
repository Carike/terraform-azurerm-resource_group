output "id" {
  description = "The ID of the Resource Group."
  value = element(coalescelist(azurerm_resource_group.this.*.id, data.azurerm_resource_group.this.*.id), 0)
}

output "name" {
  description = "The Name of the Resource Group."
  value = element(coalescelist(azurerm_resource_group.this.*.name, data.azurerm_resource_group.this.*.name), 0)
}

output "location" {
  description = "The Location of the Resource Group."
  value = element(coalescelist(azurerm_resource_group.this.*.location, data.azurerm_resource_group.this.*.location), 0)
}
