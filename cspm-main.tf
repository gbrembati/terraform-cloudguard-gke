# Create a dedicated Org-unit under the root one
resource "dome9_organizational_unit" "my-org-unit" {
  name      = var.cspm-org-unit
  depends_on = [google_container_node_pool.gke-node-pool]
}

# Onboard the K8s Cluster
resource "dome9_cloudaccount_kubernetes" "cspm-cluster" {
  name  = var.gcp-cluster-name
  organizational_unit_id = dome9_organizational_unit.my-org-unit.id

  image_assurance {
    enabled = true
  }
  admission_control {
    enabled = true
  }
}

# Create a new Notification Policy
resource "dome9_continuous_compliance_notification" "cspm-cluster-notification" {
  name           = "mail-${var.gcp-cluster-name}"
  description    = "Send mail to ${var.cspm-admin-mail} - Built and maintained with Terraform"
  alerts_console = true

  change_detection {
    email_sending_state = "Disabled"
  }
  scheduled_report {
    email_sending_state = "Enabled"

    schedule_data {
      cron_expression = "0 0 12 * * ?"
      type = "Summary"
      recipients = ["${var.cspm-admin-mail}"]
    } 
  }
}

# Create a new Continuous Policy with K8s v1.14 Best Practices
resource "dome9_continuous_compliance_policy" "cspm-cluster-policy" {
  target_id    = dome9_cloudaccount_kubernetes.cspm-cluster.id
  ruleset_id   = -72
  target_type  = "Kubernetes"
  notification_ids = ["${dome9_continuous_compliance_notification.cspm-cluster-notification.id}"]
}