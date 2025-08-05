variable "create_organization_unit" {
  description = "Whether to create OUs or not"
  type        = bool
  default     = false
}

variable "organization_unit_account_details" {
  description = "Map of OUs to account definitions"
  type = map(object({
    organization_accounts = map(object({
      email_id          = string
      close_on_deletion = optional(bool, false)
      tags              = optional(map(string), {})
      role_name         = string
    }))
  }))
}


variable "role_name" {
  type    = string
  default = "OrganizationAccountAccessRole"
}
