provider "aws" {
  region                  = "us-east-1"
}

data "aws_organizations_organization" "organization" {}

module "level_1" {
  source                            = "../modules/organization_units"
  parent_id                         = data.aws_organizations_organization.organization.roots[0].id
  organization_unit_account_details = var.organization_unit_account_details
}

## For Creating EXAMPLE's child OUs
module "level_2" {
  source                            = "../modules/organization_units"
  parent_id                         = module.level_1.org_unit_id["EXAMPLE"].id
  organization_unit_account_details = var.pw_organization_unit_account_details
}
