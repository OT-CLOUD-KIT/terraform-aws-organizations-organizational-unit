# Organization unit
[![Opstree Solutions][opstree_avatar]][opstree_homepage]<br/>[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

This module helps users in setup:
- Creation of organization units
- Creating new AWS account

## Prerequisites
- AWS access of root account/management account of control tower with admin privilege
- Terraform >= 1.3.0
- AWS CLI
## Providers
AWS

## Inputs
| Name | Description | Type | Default | Required |
|-------|----------|------|-----|-----|
|parent_id|Parent id of the OUs under which new OUs will be created| string | null | no |
|organization_unit_account_details| About OUs name(as a key), new AWS account details such as email id, parent_id close_on_deletion| map(object)| null | yes|
|create_organization_unit| Whether you want to create OUs or not| bool| true | no|

## Output
| Name | Description |
|------|-------------|
|org_unit_id|OUs which has been created by TF|

## Usage
```hcl
module "OUs" {
  source                            = "../"
  parent_id                         = "o-xxxxxxxx"
  organization_unit_account_details = var.organization_unit_account_details
}

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
    "example" = {
      organization_accounts = {
        email_id = "example@gmail.com"
        close_on_deletion = false
      }
    }
  }
  description = "Variables of organization unit"
}
```

### Contributor
Ashutosh Yadav