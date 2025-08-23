variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

# Networking
variable "vpc_name" {
  type = string
}
variable "subnet_name" {
  type = string
}
variable "subnet_cidr" {
  type = string
}

# Cluster
variable "cluster_name" {
  type = string
}

# Bucket
variable "bucket_name" {
  type = string
}

# Secret Manager
variable "secret_id" {
  type = string
}

# SQL
variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}
