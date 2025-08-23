variable "vpc_id" {
  description = "VPC network ID for the GKE cluster"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the GKE cluster"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "region" {
  description = "GCP region for the cluster"
  type        = string
}

variable "node_machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
  default     = "e2-medium"
}

variable "node_image_type" {
  description = "GKE node image type"
  type        = string
  default     = "COS_CONTAINERD"
}

variable "node_disk_size" {
  description = "Disk size for GKE nodes in GB"
  type        = number
  default     = 10
}
