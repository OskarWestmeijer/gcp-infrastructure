# main deployment serivce account
data "google_service_account" "infrastructure_sa" {
  account_id = "gcp-infrastructure"
}

# assign project wide permissions
resource "google_project_iam_binding" "infrastructure_sa_permissions" {
  project  = var.project_id
  for_each = var.infra_sa_roles
  role     = each.value
  members = [
    "serviceAccount:${data.google_service_account.infrastructure_sa.email}"
  ]
}