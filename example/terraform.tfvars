

create_organization_unit = true

organization_unit_account_details = {
  "root" = {
    organization_accounts = {
      "root-account" = {
        email_id          = "root-account@example.com"
        close_on_deletion = true
        role_name         = "OrganizationAccountAccessRole"
        tags = {
          env    = "root"
          owner  = "admin"
        }
      }
    }
  }

  "dev" = {
    organization_accounts = {}
  }

  "prod" = {
    organization_accounts = {}
  }
}
