resource "helm_release" "asset-mgmt" {
  name       = "asset-mgmt"
  repository = "https://raw.githubusercontent.com/CheckPointSW/charts/master/repository/"
  chart      = "cloudguard"
  namespace  = "checkpoint-cspm"
  create_namespace = true

  set {
    name  = "clusterID"
    value = "${dome9_cloudaccount_kubernetes.cspm-cluster.id}"
  }
  set {
    name  = "credentials.user"
    value = "${var.cspm-key-id}"
  }
  set {
    name  = "credentials.secret"
    value = "${var.cspm-key-secret}"
  }
  set {
    name  = "datacenter"
    value = "${var.cspm-residency}"
  }
  set {
    name = "addons.imageScan.enabled"
    value= "true"
  }
  set {
    name = "addons.admissionControl.enabled"
    value= "true"
  }
  depends_on = [dome9_cloudaccount_kubernetes.cspm-cluster]
}
