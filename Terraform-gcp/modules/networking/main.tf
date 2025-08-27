resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = var.mtu
}

resource "google_compute_subnetwork" "subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_cidr
  region                   = var.region
  network                  = google_compute_network.vpc.id
  private_ip_google_access = true
}

resource "google_compute_router" "router" {
  name    = var.router_name
  region  = var.region
  network = google_compute_network.vpc.id
}

resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option              = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_firewall" "allow_icmp" {
  name    = "allow-icmp"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_tcp" {
  name    = "allow-tcp"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = var.tcp_ports
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_udp" {
  name    = "allow-udp"
  network = google_compute_network.vpc.name

  allow {
    protocol = "udp"
    ports    = var.udp_ports
  }

  source_ranges = ["0.0.0.0/0"]
}
