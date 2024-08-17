resource "yandex_compute_instance" "vm-public" {
  name                      = "vm-public"
  zone                      = "ru-central1-a"
  hostname                  = "vm-public.net.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.os}"
      name        = "root-public"
      type        = "network-hdd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.public-subnet.id}"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("./id_ed25519.pub")}"
  }

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("./id_ed25519")
    host = "${yandex_compute_instance.vm-public.network_interface.0.nat_ip_address}"
  }

  provisioner "file" {
    source = "./id_ed25519"
    destination = "/home/ubuntu/.ssh/id_ed25519"
  }

  provisioner "file" {
    source = "./id_ed25519.pub"
    destination = "/home/ubuntu/.ssh/id_ed25519.pub"
  }
}