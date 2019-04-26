// Configure the Google Cloud provider
provider "google-beta" {
  credentials = "${file("${var.path_gcp_auth_json_file}")}"
  project     = "${var.gcp_project_id}"
  region      = "${var.region}"
}

module "gke-regional" {
  source  = "woernfl/gke-regional/gcp"
  version = "2.0.1"

  cluster_name                        = "${var.cluster_name}"
  logging_service                     = "${var.logging_service}"
  monitoring_service                  = "${var.monitoring_service}"
  region                              = "${var.region}"
  kube_version                        = "${var.kube_version}"
  daily_maintenance_window_start_time = "${var.daily_maintenance_window_start_time}"
  http_load_balancing                 = "${var.http_load_balancing}"
  horizontal_pod_autoscaling          = "${var.horizontal_pod_autoscaling}"
  kubernetes_dashboard                = "${var.kubernetes_dashboard}"
  network_policy_config               = "${var.network_policy_config}"
  node_pools                          = "${var.node_pools}"
}
