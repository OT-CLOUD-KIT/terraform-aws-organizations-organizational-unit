data "aws_organizations_organization" "organization" {}

module "accounts" {
  source = "../"
  create_organization_unit          = var.create_organization_unit
  parent_id                         = data.aws_organizations_organization.organization.roots[0].id
  organization_unit_account_details = var.organization_unit_account_details
  role_name                         = var.role_name
}
