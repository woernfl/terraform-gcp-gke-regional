resource "google_container_cluster" "primary" {
  provider           = "google-beta"
  name               = "${var.cluster_name}"
  location = "${var.region}"
  initial_node_count = "${var.initial_node_count}"
  logging_service    = "${var.logging_service}"
  monitoring_service = "${var.monitoring_service}"

  # Master node version
  min_master_version = "${var.kube_version}"

  # Worker Node configuration
  node_config {
    image_type   = "${var.image_type}"
    machine_type = "${var.machine_type}"
    preemptible  = "${var.preemptible_node}"

    workload_metadata_config {
      node_metadata = "${var.workload_metadata_config}"
    }
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
    client_certificate_config {
      issue_client_certificate = false
    }
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

  # Modifing default timeout
  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}
