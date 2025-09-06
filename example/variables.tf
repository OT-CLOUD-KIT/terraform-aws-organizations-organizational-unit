variable "default_tags" {
  type = object({
    ManagedBy = string
    vertical  = string
    tag_owner = string
  })
  default = {
    ManagedBy = "terraform"
    vertical  = "otcloudkit"
    tag_owner = "devops"
  }
  description = "Common tags for all resources"
}

variable "organization_unit_account_details" {
  description = "Root level OU and its accounts"
  type = map(object({
    organization_accounts = map(object({
      email_id          = string
      close_on_deletion = bool
      parent_id         = optional(string)
      tags              = optional(map(string))
    }))
  }))
}

variable "Workload_organization_unit_account_details" {
  description = "Workload OU under root and its accounts"
  type = map(object({
    organization_accounts = map(object({
      email_id          = string
      close_on_deletion = bool
      parent_id         = optional(string)
      tags              = optional(map(string))
    }))
  }))
}

variable "Prod_organization_unit_account_details" {
  description = "Prod OU under Workload and its accounts"
  type = map(object({
    organization_accounts = map(object({
      email_id          = string
      close_on_deletion = bool
      parent_id         = optional(string)
      tags              = optional(map(string))
    }))
  }))
}

variable "NonProd_organization_unit_account_details" {
  description = "Non-Prod OU under Workload and its accounts"
  type = map(object({
    organization_accounts = map(object({
      email_id          = string
      close_on_deletion = bool
      parent_id         = optional(string)
      tags              = optional(map(string))
    }))
  }))
}
