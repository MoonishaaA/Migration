terraform {
  backend "gcs" {
    bucket      = "mminiproject-bucket"   # Replace with your GCS bucket
    prefix      = "terraform/state"             # Folder inside the bucket
    project     = "my-project-learning-464616"           # Replace with your GCP project
  }
}
