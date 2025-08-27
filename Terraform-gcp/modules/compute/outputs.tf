output "instance_name" {
  value = google_compute_instance.private_vm.name
}

output "instance_zone" {
  value = google_compute_instance.private_vm.zone
}

output "instance_self_link" {
  value = google_compute_instance.private_vm.self_link
}
