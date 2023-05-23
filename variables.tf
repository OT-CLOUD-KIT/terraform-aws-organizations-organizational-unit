variable "parent_id" {
  type = string
  default = null
  description = "Parent Id for the organization unit"
}

variable "organization_unit_account_details" {
  type = map(object({
    organization_accounts = map(object({
      email_id          = string
      close_on_deletion = optional(bool, false)
      parent_id         = optional(string)
      tags              = optional(map(string))
    }))
  }))
  default = null
  description = "Variables for organization units and accounts details"
}

variable "create_organization_unit" {
  type = bool
  default = true
  description  = "When you don't want to create organization unit use false"
}