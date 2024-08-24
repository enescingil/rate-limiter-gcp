#Network
output "network" {
  value       = google_compute_network.network
  description = "The VPC resource being created"
}

output "network_name" {
  value       = google_compute_network.network.name
  description = "The name of the VPC being created"
}

output "network_id" {
  value       = google_compute_network.network.id
  description = "The ID of the VPC being created"
}

output "network_self_link" {
  value       = google_compute_network.network.self_link
  description = "The URI of the VPC being created"
}

output "project_id" {
  value       = var.shared_vpc_host && length(google_compute_shared_vpc_host_project.shared_vpc_host) > 0 ? google_compute_shared_vpc_host_project.shared_vpc_host[0].project : google_compute_network.network.project
  description = "VPC project id"
}

#MIG
output "self_link" {
  description = "Self-link of the managed instance group"
  value       = module.mig.self_link
}

output "region" {
  description = "The GCP region to create and test resources in"
  value       = var.region
}

#Project
output "project_info_example" {
  value       = module.project-factory.project_id
  description = "The ID of the created project"
}

output "domain_example" {
  value       = module.project-factory.domain
  description = "The organization's domain"
}