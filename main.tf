resource "google_container_cluster" "primary" {
  provider   = "google-beta"
  name       = "${var.cluster_name}"
  location   = "${var.region}"
  network    = "${var.network}"
  subnetwork = "${var.subnetwork}"

  remove_default_node_pool = true
  initial_node_count       = "1"
  logging_service          = "${var.logging_service}"
  monitoring_service       = "${var.monitoring_service}"

  # Master node version
  min_master_version = "${var.kube_version}"

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

    istio_config {
      disabled = "${var.istio_config}"
    }

    cloudrun_config {
      disabled = "${var.cloudrun_config}"
    }
  }

  # Modifing default timeout
  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}

resource "google_container_node_pool" "node_pool" {
  count      = "${length(var.node_pools)}"
  provider   = "google-beta"
  name       = "${lookup(var.node_pools[count.index], "name")}"
  location   = "${var.region}"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = "${lookup(var.node_pools[count.index], "node_count")}"

  management {
    auto_repair  = "${lookup(var.node_pools[count.index], "auto_repair")}"
    auto_upgrade = "${lookup(var.node_pools[count.index], "auto_upgrade")}"
  }

  # Worker Node configuration
  node_config {
    image_type   = "${lookup(var.node_pools[count.index], "image_type")}"
    machine_type = "${lookup(var.node_pools[count.index], "machine_type")}"
    preemptible  = "${lookup(var.node_pools[count.index], "preemptible")}"

    workload_metadata_config {
      node_metadata = "${lookup(var.node_pools[count.index], "node_metadata")}"
    }
  }
}
