# Reserve internal IP for VPC peering
resource "google_compute_global_address" "private_ip_address" {
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = var.private_network_id
}

# Create VPC peering for Cloud SQL private service
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = var.private_network_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

# Create Cloud SQL instance
resource "google_sql_database_instance" "psc_instance" {
  depends_on       = [google_service_networking_connection.private_vpc_connection]
  project          = var.project_id
  name             = var.instance_name
  region           = var.region
  database_version = var.database_version

  deletion_protection = false

  settings {
    tier = var.instance_tier

    backup_configuration {
      enabled           = true
      binary_log_enabled = true
    }

    ip_configuration {
      private_network = var.private_network_id
      psc_config {
        psc_enabled = true
        # allowed_consumer_projects = [var.project_id]
      }
      ipv4_enabled = false
    }

    availability_type = var.availability_type
  }
}

# Create database inside SQL instance
resource "google_sql_database" "database" {
  name     = var.db_name
  instance = google_sql_database_instance.psc_instance.name
}

# Create SQL user
resource "google_sql_user" "db_user" {
  name     = var.db_user
  instance = google_sql_database_instance.psc_instance.name
  password = var.db_password
}
