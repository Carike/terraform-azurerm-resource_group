variable "ad_groups" {
  description = "A list of display names of the groups."
  type        = list(string)
}

variable "location" {
  description = "The Azure Region where the Resource Group should exist."
  type        = string
}

variable "management_lock_create" {
  description = "Should a management lock be created."
  default     = true
  type        = bool
}

variable "resource_group_create" {
  description = "Should the resource group be created."
  type        = bool
}

variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

variable "role_definition_name" {
  description = "The name of a built-in Role."
  default     = "Reader"
  type        = string
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Resource Group."
  type        = map(any)
}
