create_organization_unit = false

organization_unit_account_details = {
  "dev" = {
    organization_accounts = {
      "dev" = {
        email_id          = "nikita55@example.com"
        close_on_deletion = true
        role_name         = "OrganizationAccountAccessRole"

        tags = {
          env = "dev"
        },
        
      }
    }
  }

  "prod" = {
    organization_accounts = {
      "prod" = {

        email_id          = "jatin33@example.com"
        close_on_deletion = true
        role_name         = "OrganizationAccountAccessRole"
        tags = {
          env = "prod"
        }
      }
    }
  }
}
