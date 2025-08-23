output "sql_instance_name" {
  description = "Cloud SQL instance name"
  value       = google_sql_database_instance.psc_instance.name
}

output "sql_private_ip" {
  description = "Private IP of the Cloud SQL instance"
  value       = google_compute_global_address.private_ip_address.address
}

output "database_name" {
  description = "Database name inside Cloud SQL"
  value       = google_sql_database.database.name
}

output "database_user" {
  description = "Database username for Cloud SQL"
  value       = google_sql_user.db_user.name
  sensitive   = true
}

output "gcp_vpc_id" {
  description = "VPC ID where the SQL instance is deployed"
  value       = var.private_network_id
}
