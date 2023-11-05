# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#------------------------------------------------------------
# Resource Group Lock configuration - Remove if not needed 
#------------------------------------------------------------
resource "azurerm_management_lock" "resource_group_level_lock" {
  count      = var.enable_resource_locks ? 1 : 0
  
  name       = "${local.resource_group_name}-${var.lock_level}-lock"
  scope      = data.azurerm_resource_group.rgrp.0.id
  lock_level = var.lock_level
  notes      = "Resource Group '${local.resource_group_name}' is locked with '${var.lock_level}' level."
}

resource "azurerm_management_lock" "data_factory_level_lock" {
  count      = var.enable_resource_locks ? 1 : 0
  
  name       = "${local.data_factory_name}-${var.lock_level}-lock"
  scope      = azurerm_data_factory.main_data_factory.id
  lock_level = var.lock_level
  notes      = "Data Factory '${local.data_factory_name}' is locked with '${var.lock_level}' level."
}