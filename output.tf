output "organization_id" {
  description = "The ID of the AWS Organization"
  value       = aws_organizations_organization.org.id
}

output "organization_arn" {
  description = "The ARN of the AWS Organization"
  value       = aws_organizations_organization.org.arn
}

output "organizational_units" {
  description = "A map of created Organizational Units and their IDs"
  value = {
    for ou_key, ou in aws_organizations_organizational_unit.ou :
    ou_key => ou.id
  }
}

output "accounts" {
  description = "A map of created AWS accounts and their IDs"
  value = {
    for acc_key, acc in aws_organizations_account.accounts :
    acc_key => acc.id
  }
}

output "account_emails" {
  description = "Emails of all created accounts"
  value = {
    for acc_key, acc in aws_organizations_account.accounts :
    acc_key => acc.email
  }
}
