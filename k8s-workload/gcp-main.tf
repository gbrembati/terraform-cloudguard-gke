resource "google_compute_network" "gke-vpc" {
  name                    = "vpc-${var.gcp-cluster-name}"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "gke-subnet" {
  name          = "net-kubernetes"
  region        = var.gcp-region
  network       = google_compute_network.gke-vpc.name
  ip_cidr_range = "10.10.0.0/24"
}

resource "google_container_cluster" "gke-cluster" {
  name                     = var.gcp-cluster-name
  location                 = var.gcp-region
  remove_default_node_pool = true
  initial_node_count       = 1
  
  network    = google_compute_network.gke-vpc.name
  subnetwork = google_compute_subnetwork.gke-subnet.name
} 

resource "google_container_node_pool" "gke-node-pool" {
  name       = "node-pool"
  location   = google_container_cluster.gke-cluster.location
  cluster    = google_container_cluster.gke-cluster.name
  
  node_count = 2
  node_locations = ["${var.gcp-region}-a","${var.gcp-region}-b"]

  node_config {
    preemptible  = true
    machine_type = "n1-standard-2"

    metadata = {
      disable-legacy-endpoints = "true"
    }
    labels = {
      env = var.gcp-project
    }
    tags         = ["gke-node", "${var.gcp-project}-gke"]
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

data "google_client_config" "client-config" {
}
