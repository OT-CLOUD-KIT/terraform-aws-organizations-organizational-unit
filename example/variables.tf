variable "organization_unit_account_details" {
  type = map(object({
    organization_accounts = map(object({
      email_id          = string
      close_on_deletion = bool
      parent_id         = optional(string)
      tags              = optional(map(string))
    }))
  }))
  default = {
    "EXAMPLE" = {
      organization_accounts = {}
    }
    "ABCD" = {
      organization_accounts = {}
    }
    "XYZ" = {
      organization_accounts = {}
    }
  }
  description = "Variables of organization units and accounts"
}

variable "pw_organization_unit_account_details" {
  type = map(object({
    organization_accounts = map(object({
      email_id          = string
      close_on_deletion = bool
      parent_id         = optional(string)
      tags              = optional(map(string))
    }))
  }))
  default = {
    "STAGE" = {
      organization_accounts = {}
    },
    "DEV" = {
      organization_accounts = {}
    },
    "PROD" = {
      organization_accounts = {}
    }
  }
  description = "Variables of child OUs of EXAMPLE organization unit"
}