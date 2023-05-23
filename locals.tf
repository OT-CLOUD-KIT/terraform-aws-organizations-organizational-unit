locals {
  organization_units = [
    for ou_name, account_details in var.organization_unit_account_details :
    ou_name
  ]

  organization_accounts = flatten([
    for ou_name, account_details in var.organization_unit_account_details :flatten([
      for account_name, account_details in account_details.organization_accounts :
      merge({
        organization_unit_name = ou_name,
        account_name = account_name,
        account_details = account_details

      })
   ])

  ])

  organization_accounts_map = {for acc_name in local.organization_accounts:
  acc_name["account_name"] => acc_name
  }
}