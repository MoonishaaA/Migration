output "secret_id" {
  description = "Secret Manager secret ID"
  value       = google_secret_manager_secret.secret.secret_id
}

output "secret_version" {
  description = "Secret Manager secret version name"
  value       = google_secret_manager_secret_version.secret_version.name
  sensitive   = true
}
