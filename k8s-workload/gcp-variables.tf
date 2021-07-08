variable "gcp-region" {
    description = "Where do you want to create it?"
    type = string
    default = "europe-west2"
}
variable "gcp-project" {
    description = "Where do you want to create it?"
    type = string
}
variable "gcp-cluster-name" {
    description = "Choose the name of the cluster"
    type = string
    default = "gke-terraform"
}