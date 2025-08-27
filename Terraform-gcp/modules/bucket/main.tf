resource "google_storage_bucket" "mminip" {
  name                       = var.bucket_name
  location                   = var.region
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
  force_destroy               = false

  versioning {
    enabled = true
  }

  labels = {
    environment = var.environment
    project     = var.project
  }
}
