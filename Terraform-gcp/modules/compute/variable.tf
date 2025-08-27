variable "region" {
  description = "GCP region for the compute instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC network ID for the compute instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the compute instance"
  type        = string
}

variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
  default     = "private-vm"
}

variable "machine_type" {
  description = "Machine type for the compute instance"
  type        = string
  default     = "e2-micro"
}

variable "boot_image" {
  description = "Boot disk image for the instance"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "environment" {
  description = "Environment label for the instance"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Project label for the instance"
  type        = string
  default     = "my-project"
}
