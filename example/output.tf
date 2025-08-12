output "organizational_units" {
  description = "Outputs of all created organizational units"
  value       = module.accounts.organizational_units
}

output "organization_accounts" {
  description = "Outputs of all created organization accounts"
  value       = module.accounts.organization_accounts
}
