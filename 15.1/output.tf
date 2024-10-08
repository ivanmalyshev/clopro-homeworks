output "internal_ip_address_nat" {
  value = "${yandex_compute_instance.nat.network_interface.0.ip_address}"
}
output "external_ip_address_nat" {
  value = "${yandex_compute_instance.nat.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_public-vm" {
  value = "${yandex_compute_instance.vm-public.network_interface.0.ip_address}"
}
output "external_ip_address_public-vm" {
  value = "${yandex_compute_instance.vm-public.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_private-vm" {
  value = "${yandex_compute_instance.vm-private.network_interface.0.ip_address}"
}
output "external_ip_address_private-vm" {
  value = "${yandex_compute_instance.vm-private.network_interface.0.nat_ip_address}"
}