// Configure the Google Cloud provider
provider "google-beta" {
  credentials = "${file("${var.path_gcp_auth_json_file}")}"
  project     = "${var.gcp_project_id}"
}

module "gke-regional" {
  source  = "woernfl/gke-regional/gcp"
  version = "1.0.3"

  gcp_project_id                      = "${var.gcp_project_id}"
  cluster_name                        = "${var.cluster_name}"
  initial_node_count                  = "${var.initial_node_count}"
  region                              = "${var.region}"
  kube_version                        = "${var.kube_version}"
  image_type                          = "${var.image_type}"
  machine_type                        = "${var.machine_type}"
  preemptible_node                    = "${var.preemptible_node}"
  workload_metadata_config            = "${var.workload_metadata_config}"
  daily_maintenance_window_start_time = "${var.daily_maintenance_window_start_time}"
  http_load_balancing                 = "${var.http_load_balancing}"
  horizontal_pod_autoscaling          = "${var.horizontal_pod_autoscaling}"
  kubernetes_dashboard                = "${var.kubernetes_dashboard}"
  network_policy_config               = "${var.network_policy_config}"
}
