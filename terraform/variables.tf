variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

provider "google" {
  project = var.project_id
  region  = "us-east"
}