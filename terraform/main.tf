terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("westmeijer-oskar-project-creds.json")

  project = var.project_id
  region  = var.project_region
  zone    = var.project_zone
}


resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_service_list)
  project  = var.project_id
  service  = each.key
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "false"
  depends_on              = [google_project_service.gcp_services]
}
