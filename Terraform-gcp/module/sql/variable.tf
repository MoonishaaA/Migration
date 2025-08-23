variable "project_id" {
  description = "GCP project ID where the SQL instance will be created"
  type        = string
}

variable "region" {
  description = "GCP region for the SQL instance"
  type        = string
}

variable "private_network_id" {
  description = "VPC network ID for the SQL instance private IP"
  type        = string
}

variable "instance_name" {
  description = "Cloud SQL instance name"
  type        = string
  default     = "psc-instance"
}

variable "database_version" {
  description = "SQL database version"
  type        = string
  default     = "MYSQL_8_0"
}

variable "instance_tier" {
  description = "Machine type for the SQL instance"
  type        = string
  default     = "db-f1-micro"
}

variable "availability_type" {
  description = "Availability type for the SQL instance"
  type        = string
  default     = "REGIONAL"
}

variable "db_name" {
  description = "Database name inside SQL instance"
  type        = string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password retrieved from Secret Manager"
  type        = string
  sensitive   = true
}
