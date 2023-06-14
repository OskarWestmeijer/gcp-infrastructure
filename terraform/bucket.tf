resource "google_storage_bucket" "weather_api_tf_bucket" {
  name                     = "weather-api-tfstate"
  force_destroy            = false
  location                 = var.project_region
  storage_class            = "STANDARD"
  public_access_prevention = "enforced"

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 2
    }
  }

  versioning {
    enabled = true
  }
}