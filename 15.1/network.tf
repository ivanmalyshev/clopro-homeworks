# Network
resource "yandex_vpc_network" "net" {
  name = "net"
}

resource "yandex_vpc_subnet" "public-subnet" {
  name = "public"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.net.id}"
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_route_table" "routing-table" {
  network_id = "${yandex_vpc_network.net.id}"

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "${var.nat-ip}"
  }
}

resource "yandex_vpc_subnet" "private-subnet" {
  name           = "private"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.net.id}"
  route_table_id = "${yandex_vpc_route_table.routing-table.id}"
  v4_cidr_blocks = ["192.168.20.0/24"]
}