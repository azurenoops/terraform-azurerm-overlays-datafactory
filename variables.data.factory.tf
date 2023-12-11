# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.


#################################
# Data Factory Configuration   ##
#################################

variable "managed_virtual_network_enabled" {
  description = "True to enable managed virtual network"
  type        = bool
  default     = true
}

variable "public_network_enabled" {
  description = "True to make data factory visible to the public network"
  type        = bool
  default     = false
}

variable "github_configuration" {
  description = "Github configuration for data factory. See documentation at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#github_configuration"
  type        = map(string)
  default     = null
}

variable "global_parameters" {
  description = "Global parameters for data factory. See documentation at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#global_parameter"
  type        = list(map(string))
  default     = []
}

variable "azure_devops_configuration" {
  description = "Azure DevOps configuration for data factory. See documentation at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#vsts_configuration"
  type        = map(string)
  default     = null
}

variable "azure_integration_runtime" {
  type = map(object({
    description             = optional(string, "Azure Integrated Runtime")
    compute_type            = optional(string, "General")
    virtual_network_enabled = optional(string, true)
    core_count              = optional(number, 8)
    time_to_live_min        = optional(number, 0)
    cleanup_enabled         = optional(bool, true)
  }))
  description = <<EOF
  Map Object to define any Azure Integration Runtime nodes that required.
  key of each object is the name of a new node.
  configuration parameters within the object allow customisation.
  EXAMPLE:
  azure_integration_runtime = {
    az-ir-co-01 {
      "compute_type" .  = "ComputeOptimized"
      "cleanup_enabled" = true
      core_count        = 16
    },
    az-ir-gen-01 {},
    az-ir-gen-02 {},
  }

EOF
  default     = {}
}

variable "selfhosted_integration_runtime" {
  type = map(object({
    description = optional(string, "Self Hosted Integration Runtime")
  }))
  description = <<EOF
  Map Object to define any Self Hosted Integration Runtime nodes that required.
  key of each object is the name of a new node.
  configuration parameters within the object allow customisation.
  EXAMPLE:
  selfhosted_integration_runtime = {
    sh-ir-co-01 {
      "description" = "Self Hosted Integration Runtime"      
    },
    sh-ir-gen-01 {},
    sh-ir-gen-02 {},
  }
EOF
  default     = {}
}

variable "azure_ssis_integration_runtime" {
  type = map(object({
    description                      = optional(string, "Azure SSIS Integration Runtime")
    node_size                        = optional(string, "Standard_D4_v3")
    number_of_nodes                  = optional(number, 1)
    max_parallel_executions_per_node = optional(number, 1)
    edition                          = optional(string, "Standard")
    license_type                     = optional(string, "LicenseIncluded")
  }))
  description = <<EOF
  Map Object to define any Azure SSIS Integration Runtime nodes that required.
  key of each object is the name of a new node.
  configuration parameters within the object allow customisation.
  EXAMPLE:
  azure_ssis_integration_runtime = {
    az-ssis-ir-co-01 {
      "node_size"                        = "Standard_D4_v3"
      "number_of_nodes"                  = 1
      "max_parallel_executions_per_node" = 1
      "edition"                          = "Standard"
      "license_type"                     = "LicenseIncluded"
    },
    az-ssis-ir-gen-01 {},
    az-ssis-ir-gen-02 {},
  }
EOF
  default     = {}
}

##########################################
# Data Factory Identity Configuration   ##
##########################################

variable "identity_type" {
  description = "Specifies the type of Managed Service Identity that should be configured on this Storage Account. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned` (to enable both)."
  type        = string
  default     = "SystemAssigned"
}

variable "identity_ids" {
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Storage Account."
  type        = list(string)
  default     = null
}
