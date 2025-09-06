data "aws_organizations_organization" "organization" {}

module "level_1" {
  source                            = "OT-CLOUD-KIT/organizations-organizational-unit/aws"
  version                           = "0.0.1"
  parent_id                         = data.aws_organizations_organization.organization.roots[0].id
  organization_unit_account_details = var.organization_unit_account_details
}

module "level_2" {
  source                            = "OT-CLOUD-KIT/organizations-organizational-unit/aws"
  version                           = "0.0.1"
  parent_id                         = module.level_1.org_unit_id["Example"].id
  organization_unit_account_details = var.Workload_organization_unit_account_details
}

module "level_3a" {
  source                            = "OT-CLOUD-KIT/organizations-organizational-unit/aws"
  version                           = "0.0.1"
  parent_id                         = module.level_2.org_unit_id["Workload"].id
  organization_unit_account_details = var.Prod_organization_unit_account_details
}

module "level_3b" {
  source                            = "OT-CLOUD-KIT/organizations-organizational-unit/aws"
  version                           = "0.0.1"
  parent_id                         = module.level_2.org_unit_id["Workload"].id
  organization_unit_account_details = var.NonProd_organization_unit_account_details
}
