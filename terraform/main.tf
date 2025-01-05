provider "google" {
  project = var.project_id
  region  = "us-east"  # Modify as per your needs
}

resource "google_container_cluster" "primary" {
  name               = "my-gke-cluster"
  location           = "us-east"
  initial_node_count = 3

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"  # Properly reference project ID
  }

  node_config {
    machine_type = "e2-standard-4"
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}