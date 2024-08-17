resource "yandex_compute_instance" "vm-private" {
  name                      = "vm-private"
  zone                      = "ru-central1-a"
  hostname                  = "vm-private.net.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.os}"
      name        = "root-private"
      type        = "network-hdd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.private-subnet.id}"
    nat       = false
  }

  metadata = {
    ssh-keys = "ubuntu:${file("./id_ed25519.pub")}"
  }
}