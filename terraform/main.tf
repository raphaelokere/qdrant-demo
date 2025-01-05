provider "google" {
  credentials = file("<path-to-your-service-account-key>.json")
  project     = "<your-gcp-project-id>"
  region      = "<your-region>"
}

resource "google_container_cluster" "primary" {
  name               = "qdrant-cluster"
  location           = "<your-zone>"
  initial_node_count = 3

  node_config {
    machine_type = "e2-standard-4"  # Adjust CPU/Memory based on your needs
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}