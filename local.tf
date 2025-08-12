locals {
  organization_units = var.create_organization_unit ? [
    for ou_name, _ in var.organization_unit_account_details :
    ou_name if ou_name != "" && ou_name != "root"
  ] : []

  organization_accounts = flatten([
    for ou_name, ou_details in var.organization_unit_account_details : [
      for account_name, account_details in ou_details.organization_accounts : {
        organization_unit_name = ou_name
        account_name           = account_name
        account_details        = account_details
      }
    ]
  ])

  organization_accounts_map = {
    for acc in local.organization_accounts :
    acc.account_name => acc
  }
}
