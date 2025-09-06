default_tags = {
  ManagedBy = "terraform"
  vertical  = "otcloudkit"
  tag_owner = "devops"
}

organization_unit_account_details = {
  "Example" = {
    organization_accounts = {
      "example-root" = {
        email_id          = "abc.34@gmail.com"
        close_on_deletion = false
        tags = {
          environment = "root"
          owner       = "platform-team"
        }
      }
    }
  }
}

Workload_organization_unit_account_details = {
  "Workload" = {
    organization_accounts = {
      "workload-main" = {
        email_id          = "worknikita.1111@gmail.com"
        close_on_deletion = true
        tags = {
          environment = "shared"
          team        = "platform"
        }
      }
    }
  }
}

Prod_organization_unit_account_details = {
  "Prod" = {
    organization_accounts = {
      "prod-core-app" = {
        email_id          = ""
        close_on_deletion = true
        tags = {
          environment = "prod"
          owner       = "prod-team"
        }
      }
    }
  }
}

NonProd_organization_unit_account_details = {
  "Non-Prod" = {
    organization_accounts = {
      "nonprod-core-app" = {
        email_id          = "worknikita.1111@gmail.com"
        close_on_deletion = false
        tags = {
          environment = "non-prod"
          owner       = "qa-team"
        }
      }
    }
  }
}
