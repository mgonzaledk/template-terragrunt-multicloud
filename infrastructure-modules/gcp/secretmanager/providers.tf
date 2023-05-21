provider "google" {
  credentials = file(var.gcp_credentials)
  project     = var.gcp_project
  region      = var.gcp_region
}

variable "gcp_project" {
  description = "The GCP project to create resources in"
  type        = string
}

variable "gcp_region" {
  description = "The GCP region to create resources in"
  type        = string
}

variable "gcp_credentials" {
  description = "Path to the GCP credentials JSON file"
  type        = string
}
