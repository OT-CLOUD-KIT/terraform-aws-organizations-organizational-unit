
variable "create_organization_unit" {
  type    = bool
  default = false
}

variable "parent_id" {
  type = string
    default = null

}

variable "organization_unit_account_details" {
  type = map(object({
    organization_accounts = map(object({
      email_id           = string
      parent_id         = optional(string)
     close_on_deletion = optional(bool, false)
      role_name         = optional(string)      
      tags              = optional(map(string))
    }))
  }))
}
