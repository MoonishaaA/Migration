resource "google_compute_instance" "private_vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = format("%s-a", var.region)

  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }

  network_interface {
    network    = var.vpc_id
    subnetwork = var.subnet_id
  }

  labels = {
    environment = var.environment
    project     = var.project
  }
}
