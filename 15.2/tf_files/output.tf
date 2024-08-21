output "Picture_URL" {
  value = "https://${yandex_storage_bucket.imalyshev.bucket_domain_name}/${yandex_storage_object.picture.key}"
}

output "all_vms" {
  value = [
    for instance in yandex_compute_instance_group.group-vms.instances : {
      name = instance.name
      ip_internal = instance.network_interface[0].ip_address
      ip_external = instance.network_interface[0].nat_ip_address}
  ]
}

output "Network_LB_IP_address" {
  value = yandex_lb_network_load_balancer.nlb.listener.*.external_address_spec[0].*.address
}
