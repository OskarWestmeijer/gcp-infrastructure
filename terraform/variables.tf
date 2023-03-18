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
    "oslogin.googleapis.com",
    "compute.googleapis.com", // Service Usage API
    "cloudresourcemanager.googleapis.com"
  ]
}