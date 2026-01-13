provider "yandex" {
  token     = var.yandex_token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_vpc_network" "network" {
  name = "kubernates-network"
}

resource "yandex_vpc_subnet" "subnet" {
  name = "subnet1"
  zone = var.zone
  network_id = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_compute_instance" "k8s_master" {
  name        = "k8s-master"
  platform_id = "standard-v1"
  zone        = var.zone

  resources {
    cores  = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = "fd8pj9ph7itu8mkgn80k"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_public_key_path)}"
  }
}

resource "yandex_compute_instance" "k8s_app" {
  name        = "k8s-app"
  platform_id = "standard-v1"
  zone        = var.zone

  resources {
    cores  = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = "fd8pj9ph7itu8mkgn80k"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_public_key_path)}"
  }
}

resource "yandex_compute_instance" "srv" {
  name        = "srv"
  platform_id = "standard-v1"
  zone        = var.zone

  resources {
    cores  = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = "fd8pj9ph7itu8mkgn80k"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_public_key_path)}"
  }
}