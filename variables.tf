######## GCP provide ########
# GCP project ID
variable "gcp_project_id" {
  description = "GCP Project ID"
}

######## GKE vars ########
# Name of the GKE cluster
variable "cluster_name" {
  description = "Name of the cluster"
}

# Number of nodes per zone
variable "initial_node_count" {
  description = "Number of nodes to be created per node"
}

# Zone where the master will be deployed
variable "region" {
  description = "Region where the nodes will be deployed"
}

######## GKE worker nodes configuration variables ########
# Kubernetes version
variable "kube_version" {
  description = "Kubernetes version"
}

# Worker nodes image type
variable "image_type" {
  description = "Worker nodes image type"
}

# Worker nodes type
variable "machine_type" {
  description = "Worker machine type"
}

# Worker nodes preemptible choice
variable "preemptible_node" {
  description = "Choose if nodes should be preemptible ones or not. Set to true to have preemptible nodes"
}

# Daily maintenance window start time (duration will always be the minimum one)
variable "daily_maintenance_window_start_time" {
  description = "Daily maintenance window start time (format 'HH:MM', where HH : [00-23] and MM : [00-59] GMT)"
}

############## Addon vars ###########
# Should the following addons be disabled
variable "http_load_balancing" {
  description = "Should http_load_balancing addon be disabled? (true/false)"
}

variable "horizontal_pod_autoscaling" {
  description = "Should horizontal_pod_autoscaling addon be disabled? (true/false)"
}

variable "kubernetes_dashboard" {
  description = "Should kubernetes_dashboard addon be disabled? (true/false)"
}

variable "network_policy_config" {
  description = "Should network_policy_config addon be disabled? (true/false)"
}