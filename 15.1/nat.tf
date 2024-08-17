resource "yandex_compute_instance" "nat" {
  name                      = "nat"
  zone                      = "ru-central1-a"
  hostname                  = "nat.net.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.nat-os}"
      name        = "root-nat"
      type        = "network-hdd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.public-subnet.id}"
    ip_address = "${var.nat-ip}"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("./id_ed25519.pub")}"
  }
}