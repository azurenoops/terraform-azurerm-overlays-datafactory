# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_data_factory_integration_runtime_azure" "integration_runtime" {
  for_each = var.azure_integration_runtime

  data_factory_id = azurerm_data_factory.main_data_factory.id
  name            = each.key
  location        = local.location
  description     = each.value.description

  compute_type            = each.value.compute_type
  core_count              = each.value.core_count
  time_to_live_min        = each.value.time_to_live_min
  cleanup_enabled         = each.value.cleanup_enabled
  virtual_network_enabled = each.value.virtual_network_enabled
}

resource "azurerm_data_factory_integration_runtime_self_hosted" "integration_runtime" {
  for_each = var.selfhosted_integration_runtime

  data_factory_id = azurerm_data_factory.main_data_factory.id
  name            = each.key
  description     = each.value.description
}

resource "azurerm_data_factory_integration_runtime_azure_ssis" "integration_runtime" {
  for_each = var.azure_ssis_integration_runtime

  data_factory_id = azurerm_data_factory.main_data_factory.id
  name            = each.key
  location        = var.location
  description     = each.value.description

  node_size                        = each.value.node_size
  number_of_nodes                  = each.value.number_of_nodes
  max_parallel_executions_per_node = each.value.max_parallel_executions_per_node
  edition                          = each.value.edition
  license_type                     = each.value.license_type
}
