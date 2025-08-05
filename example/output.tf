output "organization_id" {
  description = "The ID of the AWS Organization"
  value       = data.aws_organizations_organization.organization.id
}

output "root_ou_id" {
  description = "The Root Organizational Unit ID"
  value       = data.aws_organizations_organization.organization.roots[0].id
}

output "organizational_units" {
  description = "A map of created Organizational Units and their IDs"
  value       = module.accounts.organizational_units
}

output "accounts" {
  description = "A map of created AWS accounts and their IDs"
  value       = module.accounts.accounts
}

output "account_emails" {
  description = "Emails of all created accounts"
  value       = module.accounts.account_emails
}
