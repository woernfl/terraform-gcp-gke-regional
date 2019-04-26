######## GKE vars ########
# Name of the GKE cluster
variable "cluster_name" {
  description = "Name of the cluster"
}

# Logging service that will be used
variable "logging_service" {
  description = "Logging service that will be used"
}

# Monitoring service that will be used
variable "monitoring_service" {
  description = "Monitoring service that will be used"
}

# Region where the cluster will be deployed
variable "region" {
  description = "Region where the cluster will be deployed"
}

# Network on which is sitting the cluster
variable "network" {
  description = "Name of the network in which the cluster will be sitting"
  default     = "default"
}

# Sub-network on which is sitting the cluster
variable "subnetwork" {
  description = "Name of the sub-network in which the cluster will be sitting"
  default     = "default"
}

# Kubernetes version
variable "kube_version" {
  description = "Kubernetes version"
}

# Daily maintenance window start time (duration will always be the minimum one)
variable "daily_maintenance_window_start_time" {
  description = "Daily maintenance window start time (format 'HH:MM', where HH : [00-23] and MM : [00-59] GMT)"
}

############## Addon vars ###########
# Should the following addons be disabled
variable "http_load_balancing" {
  description = "Should http_load_balancing addon be disabled? (true/false)"
  default     = "false"
}

variable "horizontal_pod_autoscaling" {
  description = "Should horizontal_pod_autoscaling addon be disabled? (true/false)"
  default     = "true"
}

variable "kubernetes_dashboard" {
  description = "Should kubernetes_dashboard addon be disabled? (true/false)"
  default     = "true"
}

variable "network_policy_config" {
  description = "Should network_policy_config addon be disabled? (true/false)"
  default     = "true"
}

variable "istio_config" {
  description = "Should istio_config addon be disabled? (true/false)"
  default     = "true"
}

variable "cloudrun_config" {
  description = "Should cloudrun_config addon be disabled? (true/false)"
  default     = "true"
}

######## GKE worker nodes configuration variables ########
# List of map containing all node pools infos
variable "node_pools" {
  description = "All variables regarding nodes are expressed here"

  default = [
    {
      # Node pool name
      name = "default-pool"

      # Number of nodes per zone
      node_count = "1"

      # Node auto repair option
      auto_repair = "true"

      # Node auto upgrade option
      auto_upgrade = "true"

      # Worker nodes image type
      image_type = "COS"

      # Worker nodes type
      machine_type = "n1-standard-1"

      # Worker nodes preemptible choice
      preemptible = "false"

      # Choose if the Metadate should be expose to the node pool
      node_metadata = "SECURE"
    },
  ]
}
