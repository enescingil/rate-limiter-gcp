module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 15.0"

  random_project_id       = true
  name                    = "simple-rate-limiter-project"
  org_id                  = var.organization_id
  billing_account         = var.billing_account
  default_service_account = "sa_name"

  activate_api_identities = [{
    api = "healthcare.googleapis.com"
    roles = [
      "roles/healthcare.serviceAgent",
      "roles/bigquery.jobUser",
    ]
  }]
}