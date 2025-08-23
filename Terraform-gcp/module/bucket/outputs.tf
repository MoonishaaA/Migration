output "bucket_name" {
  value = google_storage_bucket.mminip.name
}

output "bucket_url" {
  value = "gs://${google_storage_bucket.mminip.name}"
}
