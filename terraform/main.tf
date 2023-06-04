# enables service apis, overview in Service Usage API
resource "google_project_service" "gcp_services" {
  for_each                   = toset(var.gcp_service_list)
  project                    = var.project_id
  service                    = each.key
  disable_dependent_services = true
}

# main deployment serivce account
data "google_service_account" "infrastructure_sa" {
  account_id = "gcp-infrastructure"
}

resource "google_project_iam_binding" "infrastructure_sa_permissions" {
  project  = var.project_id
  for_each = var.infra_sa_roles
  role     = each.value
  members = [
    "serviceAccount:${data.google_service_account.infrastructure_sa.email}"
  ]
}