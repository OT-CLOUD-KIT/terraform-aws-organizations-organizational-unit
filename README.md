# Terraform AWS Organizations Organizational Unit

A Terraform module to manage **AWS Organizations Organizational Units (OUs)** and optionally create **member accounts** within those OUs. This module supports multi-level OU hierarchies and reusable patterns to structure accounts based on environments, teams, or workloads.

---

##  Architecture

> **Note:**  
> The above diagram illustrates a 3-level hierarchy for an AWS Organization. The structure can be adjusted to suit specific use cases such as team-based, environment-based, or function-based organization structures.

---

##  Features

- Create multi-level Organizational Units
- Create AWS accounts within OUs
- Tagging support
- Modular and reusable
- Supports cross-level parent-child relationships

---

##  Usage

```hcl

data "aws_organizations_organization" "this" {}

data "aws_organizations_organization" "organization" {}

module "accounts" {
  source = "OT-CLOUD-KIT/terraform-aws-organizations-organizational-unit"

  create_organization_unit = false
  parent_id                = data.aws_organizations_organization.organization.roots[0].id
  role_name                = "OrganizationAccountAccessRole"

  organization_unit_account_details = {
    "dev" = {
      name      = "dev-account"
      email     = "dev@example.com"
      role_name = "OrganizationAccountAccessRole"
    }
    "prod" = {
      name      = "prod-account"
      email     = "prod@example.com"
      role_name = "OrganizationAccountAccessRole"
    }
    "nonprod" = {
      name      = "nonprod-account"
      email     = "nonprod@example.com"
      role_name = "OrganizationAccountAccessRole"
    }
  }
}


```

## Resources

| Resource                                                                                                                                                 | Description                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| [`aws_organizations_organizational_unit`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | Creates an Organizational Unit (OU) within AWS Organizations |
| [`aws_organizations_account`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account)                         | Creates a new AWS account within the specified OU            |


___

## Input


| Name                                                                                                                                                                | Description                                        | Type          | Default | Required |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_default_tags"></a> [default\_tags](#input_default_tags)                                                                                              | Default tags applied to all AWS resources          | `map(string)` | `{}`    |    no    |
| <a name="input_organization_unit_account_details"></a> [organization\_unit\_account\_details](#input_organization_unit_account_details)                             | OU and account mapping for top-level OU            | `map(any)`    | n/a     |    yes   |
| <a name="input_Workload_organization_unit_account_details"></a> [Workload\_organization\_unit\_account\_details](#input_Workload_organization_unit_account_details) | OU and account mapping under `transbnk > Workload` | `map(any)`    | n/a     |    yes   |
| <a name="input_Prod_organization_unit_account_details"></a> [Prod\_organization\_unit\_account\_details](#input_Prod_organization_unit_account_details)             | OU and account mapping under `Workload > Prod`     | `map(any)`    | n/a     |    yes   |
| <a name="input_NonProd_organization_unit_account_details"></a> [NonProd\_organization\_unit\_account\_details](#input_NonProd_organization_unit_account_details)    | OU and account mapping under `Workload > Non-Prod` | `map(any)`    | n/a     |    yes   |


___


## Output

| Name                                                                   | Description                                                                                                                                                    |
| ---------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <a name="output_org_unit_id"></a> [org\_unit\_id](#output_org_unit_id) | Map of created AWS Organization Units (OUs) with their attributes (e.g., ID, ARN, etc.) as returned by the resource `aws_organizations_organizational_unit.ou` |


___


## Contributors

- [Piyush Upadhyay](https://github.com/piiiyuushh)
- [Nikita Joshi](https://github.com/jnikita19)


