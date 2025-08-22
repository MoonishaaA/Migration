variable "host_project_id" {
  description = "The host project ID"
  type        = string
}

variable "service_project_id" {
  description = "The service project ID"
  type        = string
}

variable "region" {
  description = "Region for subnets"
  type        = string
  default     = "us-central1"
}

variable "service_account_email" {
  description = "Service account in service project that will use the VPC"
  type        = string
}
