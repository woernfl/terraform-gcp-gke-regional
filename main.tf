resource "google_container_cluster" "primary" {
  provider           = "google-beta"
  name               = "${var.cluster_name}"
  region             = "${var.region}"
  initial_node_count = "${var.initial_node_count}"

  # Master node version
  min_master_version = "${var.kube_version}"

  # Worker Node configuration
  node_config {
    image_type   = "${var.image_type}"
    machine_type = "${var.machine_type}"
    preemptible  = "${var.preemptible_node}"
  }

  # Set a maintancence window
  maintenance_policy {
    daily_maintenance_window {
      start_time = "${var.daily_maintenance_window_start_time}"
    }
  }

  # Basic auth disabled
  master_auth {
    username = ""
    password = ""
  }

  # Addons availables
  addons_config {
    http_load_balancing {
      disabled = "${var.http_load_balancing}"
    }

    horizontal_pod_autoscaling {
      disabled = "${var.horizontal_pod_autoscaling}"
    }

    kubernetes_dashboard {
      disabled = "${var.kubernetes_dashboard}"
    }

    network_policy_config {
      disabled = "${var.network_policy_config}"
    }
  }
}