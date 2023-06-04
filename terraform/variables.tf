variable "project_id" {
  description = "Name / Id of my GCP project"
  type        = string
  default     = "westmeijer-oskar"
}

variable "project_region" {
  description = "Default region"
  type        = string
  default     = "europe-west3"
}

variable "project_zone" {
  description = "Default zone"
  type        = string
  default     = "europe-west3-a"
}

variable "gcp_service_list" {
  description = "The list of apis necessary for the project"
  type        = list(string)
  default = [
    "oslogin.googleapis.com",              // Cloud OS Login API
    "compute.googleapis.com",              // Compute Engine API
    "cloudresourcemanager.googleapis.com", // Cloud Resource Manager API
    "iam.googleapis.com"                   // Identity and Access Management (IAM) API, edit service account permissions
  ]
}

variable "infra_sa_roles" {
  type = set(string)
  default = [
    "roles/resourcemanager.organizationAdmin",
    "roles/run.admin"
  ]
}