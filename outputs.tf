# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

###############
# Outputs    ##
###############

output "data_factory_id" {
  description = "Data factory id"
  value       = azurerm_data_factory.main_data_factory.id
}

output "data_factory_name" {
  description = "Data factory name"
  value       = azurerm_data_factory.main_data_factory.name
}

output "data_factory_managed_identity" {
  description = "Type of managed identity"
  value       = azurerm_data_factory.main_data_factory.identity
}

output "global_paramaters" {
  description = "A map showing any created Global Parameters."
  value       = { for gp in azurerm_data_factory.main_data_factory.global_parameter : gp.name => gp }
}

output "data_factory_resource_group_name" {
  description = "Data factory resource group name"
  value       = azurerm_data_factory.main_data_factory.resource_group_name
}

output "data_factory_location" {
  description = "Data factory location"
  value       = azurerm_data_factory.main_data_factory.location
}


