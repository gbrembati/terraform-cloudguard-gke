terraform {
  required_version = ">= 0.15"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 3.74.0"
    }
    dome9 = {
      source = "dome9/dome9"
      version = ">= 1.21.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.3.2"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.2.0"
    }
  }
}

provider "google" {
  region        = var.gcp-region
  project       = var.gcp-project
  credentials   = file("${var.gcp-key-name}")
}

provider "kubernetes" {
  host  = "https://${google_container_cluster.gke-cluster.endpoint}"
  token = data.google_client_config.client-config.access_token
  cluster_ca_certificate = base64decode(
    google_container_cluster.gke-cluster.master_auth[0].cluster_ca_certificate,
  )
}

provider "dome9" {
  dome9_access_id   = var.cspm-key-id
  dome9_secret_key  = var.cspm-key-secret
}

provider "helm" {
  kubernetes {
    host  = "https://${google_container_cluster.gke-cluster.endpoint}"
    token = data.google_client_config.client-config.access_token
    cluster_ca_certificate = base64decode(
      google_container_cluster.gke-cluster.master_auth[0].cluster_ca_certificate,
    )
  }
}
