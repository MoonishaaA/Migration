variable "project_id" {
  description = "GCP project ID where the secret will be created"
  type        = string
}

variable "secret_id" {
  description = "Name/ID of the secret"
  type        = string
}

variable "secret_data" {
  description = "The secret value to store in Secret Manager"
  type        = string
  sensitive   = true
}
