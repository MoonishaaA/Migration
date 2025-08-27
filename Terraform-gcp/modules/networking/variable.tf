variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "mtu" {
  description = "MTU for the VPC"
  type        = number
  default     = 1460
}

variable "router_name" {
  description = "Name of the Cloud Router"
  type        = string
  default     = "router-1"
}

variable "nat_name" {
  description = "Name of the Cloud NAT"
  type        = string
  default     = "nat"
}

variable "tcp_ports" {
  description = "TCP ports to allow in firewall"
  type        = list(string)
  default     = ["22", "443", "8080", "80"]
}

variable "udp_ports" {
  description = "UDP ports to allow in firewall"
  type        = list(string)
  default     = ["22", "443", "8080", "80"]
}
