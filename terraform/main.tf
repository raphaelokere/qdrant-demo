provider "google" {
  project = var.project_id
  region  = "us-east"
}

resource "google_container_cluster" "primary" {
  name               = "qdrant-cluster"
  location           = "us-east"
  initial_node_count = 3

  node_config {
    machine_type = "e2-standard-4"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}