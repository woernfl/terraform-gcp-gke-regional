resource "null_resource" "client_gke_credentials" {
  provisioner "local-exec" {
    command = "gcloud beta container clusters get-credentials ${var.cluster_name} --region ${var.region} --project ${var.gcp_project_id}"
  }

  depends_on = ["module.gke-regional"]

  provisioner "local-exec" {
    when    = "destroy"
    command = "kubectl config delete-context gke_${var.gcp_project_id}_${var.region}_${var.cluster_name}"
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "kubectl config delete-cluster gke_${var.gcp_project_id}_${var.region}_${var.cluster_name}"
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "kubectl config unset users.gke_${var.gcp_project_id}_${var.region}_${var.cluster_name}"
  }
}
