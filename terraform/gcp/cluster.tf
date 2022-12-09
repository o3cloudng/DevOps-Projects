locals {
  tag_name           = "argue"
  region             = "europe-west1"
  pod_range_name     = "pod-ip-range"
  service_range_name = "service-ip-range"
  project_name       = "playground-369107"
  services_to_enable = ["compute.googleapis.com", "container.googleapis.com"]
}

# Enable Needed Project Services
resource "google_project_service" "argue_project" {
  for_each = toset(local.services_to_enable)
  project  = local.project_name
  service  = each.value
}

# argue Network(VPC)
resource "google_compute_network" "argue_network" {
  name                    = "${local.tag_name}-network"
  auto_create_subnetworks = false
  depends_on              = [google_project_service.argue_project]
}

# argue Kubernetes Cluster
resource "google_container_cluster" "argue_cluster" {
  name       = "${local.tag_name}-cluster"
  location   = local.region
  network    = google_compute_network.argue_network.name
  subnetwork = google_compute_subnetwork.argue_subnet.name

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

## Handson Cluster Nodes
resource "google_container_node_pool" "argue_preemptible_nodes" {
  name       = "${local.tag_name}-node-pool"
  location   = local.region
  cluster    = google_container_cluster.argue_cluster.name
  node_count = 1
  node_locations = [
    "europe-west1-b",
    "europe-west1-c",
  ]
  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.argue-sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

## argue Cluster Node Service Account
resource "google_service_account" "argue-sa" {
  account_id   = "${local.tag_name}-sa"
  display_name = "Hands On"
}
