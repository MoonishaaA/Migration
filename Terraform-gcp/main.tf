terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# 1. Enable Shared VPC host project
resource "google_compute_shared_vpc_host_project" "host" {
  project = var.project_id
}

# 2. Create a VPC in the host project
resource "google_compute_network" "shared_vpc" {
  name                    = "shared-vpc"
  auto_create_subnetworks = false
  project                 = var.project_id
}

# 3. Create Subnets in the Shared VPC
resource "google_compute_subnetwork" "subnet1" {
  name          = "subnet-1"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.shared_vpc.id
  project       = var.project_id
}

resource "google_compute_subnetwork" "subnet2" {
  name          = "subnet-2"
  ip_cidr_range = "10.0.2.0/24"
  region        = var.region
  network       = google_compute_network.shared_vpc.id
  project       = var.project_id
}

# 4. Attach a Service Project to Shared VPC
resource "google_compute_shared_vpc_service_project" "service" {
  host_project    = var.project_id
  service_project = var.service_project_id
}

# 5. Grant IAM roles so service project can use subnets
resource "google_project_iam_member" "network_user_role" {
  project = var.project_id
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:${var.service_account_email}"
}
