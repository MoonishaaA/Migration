terraform {
  backend "gcs" {
    bucket      = "mminiproject-bucket"   # Replace with your GCS bucket
    prefix      = "terraform/state"             #  Replace with your GCP project
  }
}
