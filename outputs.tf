output "client_certificate" {
  description = "Client certificate"
  sensitive   = true
  value       = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  description = "Client key"
  sensitive   = true
  value       = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  description = "Cluster ca certificate"
  sensitive   = true
  value       = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}
