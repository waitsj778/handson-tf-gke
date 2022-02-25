locals {
  region = "asia-northeast1"
  machine_type = "e2-medium"
}

resource "google_service_account" "default" {
  account_id   = join("-", [local.projects[terraform.workspace], "gke", "sa"])
  display_name = "Service Account"
}

resource "google_container_cluster" "primary" {
  name     = join("-", [local.projects[terraform.workspace], "gke"])
  location = local.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "custom_nodes" {
  name       = join("-", [local.projects[terraform.workspace], "node_pool"])
  location   = local.region
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = false
    machine_type = local.machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
