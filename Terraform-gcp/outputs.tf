output "vpc_id" {
  description = "ID of the VPC"
  value       = module.networking.vpc_id
}

output "vm_instance_name" {
  description = "Name of the VM instance"
  value       = module.compute.instance_name
}

output "cluster_name" {
  description = "GKE Cluster name"
  value       = module.cluster.cluster_name
}

output "bucket_name" {
  description = "Storage bucket name"
  value       = module.bucket.bucket_name
}

output "sql_instance_name" {
  description = "Cloud SQL instance name"
  value       = module.sql.sql_instance_name
}

output "sql_private_ip" {
  description = "Private IP of the Cloud SQL instance"
  value       = module.sql.sql_private_ip
}

output "database_name" {
  description = "Database name inside Cloud SQL"
  value       = module.sql.database_name
}

output "database_user" {
  description = "Database username"
  value       = module.sql.database_user
  sensitive   = true
}

output "secret_id" {
  description = "Secret Manager secret ID"
  value       = module.secret_manager.secret_id
}
