resource "google_compute_network" "main" {
  name                    = join("-", [local.projects[terraform.workspace], "vpc"])
  description             = "vpc for practice"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "main" {
  name          = join("-", [local.projects[terraform.workspace], "subnetwork"])
  ip_cidr_range = "10.2.0.0/16"
  network       = google_compute_network.main.id
}
