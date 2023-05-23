resource "aws_organizations_organizational_unit" "ou" {
  for_each  = var.create_organization_unit ? toset(distinct(local.organization_units)) : []
  name      = each.key
  parent_id = var.parent_id
}

resource "aws_organizations_account" "member_accounts" {
  for_each          = local.organization_accounts_map != null ? local.organization_accounts_map : {}
  name              = each.key
  email             = each.value.account_details.email_id
  parent_id         = var.create_organization_unit ? aws_organizations_organizational_unit.ou[each.value.organization_unit_name].id : each.value.account_details.parent_id
  close_on_deletion = each.value.account_details.close_on_deletion
  tags              = each.value.account_details.tags
}
