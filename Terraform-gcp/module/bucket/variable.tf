variable "bucket_name" {
  description = "Name of the GCS bucket"
  type        = string
}

variable "region" {
  description = "Region where the bucket will be created"
  type        = string
}

variable "environment" {
  description = "Environment label for the bucket"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "GCP project ID"
  type        = string
}
