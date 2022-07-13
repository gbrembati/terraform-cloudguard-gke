resource "kubernetes_namespace" "app-namespace" {
  metadata {
    name = "${var.app-name}-ns"
  }
  depends_on = [google_container_node_pool.gke-node-pool]
}

resource "kubernetes_deployment" "app-deployment" {
  metadata {
    name      = var.app-name
    namespace = kubernetes_namespace.app-namespace.id
    labels = {
      app = var.app-name
    }
  }
  spec {
    replicas = 3
    selector {
      match_labels = {
        app = var.app-name
      }
    }
    template {
      metadata {
        labels = {
          app = var.app-name
        }
      }
      spec {
        container {
          image = var.app-image
          name  = var.app-name
        }
      }
    }
  }
}

resource "kubernetes_service" "app-svc" {
  metadata {
    name      = var.app-name
    namespace = kubernetes_namespace.app-namespace.id
  }
  spec {
    selector = {
      app = kubernetes_deployment.app-deployment.metadata[0].labels.app
    }
    port {
      port        = 3000
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}