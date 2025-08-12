output "organizational_units" {
  description = "List of Organizational Units created"
  value = var.create_organization_unit ? {
    for k, ou in aws_organizations_organizational_unit.ou :
    k => {
      name      = ou.name
      id        = ou.id
      arn       = ou.arn
      parent_id = ou.parent_id
    }
  } : {}
}

output "organization_accounts" {
  description = "List of Organization Accounts created"
  value = {
    for name, account in aws_organizations_account.accounts :
    name => {
      name              = account.name
      email             = account.email
      account_id        = account.id
      arn               = account.arn
      parent_id         = account.parent_id
      role_name         = account.role_name
      tags              = account.tags
      status            = account.status
    }
  }
}
