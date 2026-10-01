resource "incus_image" "haos" {
  source_file = {
    data_path = "/tmp/haos.qcow2"
    metadata_path = "/tmp/haos-metadata.tar.gz"
  }
}

resource "incus_instance" "home-assistant" {
  type = "virtual-machine"
  name = "home-assistant"

  image = incus_image.haos.fingerprint

  config = {

    # Resource Settings
    "limits.cpu" = "sockets=${var.home_assistant.cpu_sockets},cores=${var.home_assistant.cpu_cores},threads=${var.home_assistant.cpu_threads}"
    "limits.memory" = "${var.home_assistant.memory}MiB"
  }

  device {
    name = "root"
    type = "disk"

    properties = {
        pool = "vm-disks"
        path = "/"
        size = "${var.home_assistant.disk_space}GiB"
    }
  }

  device {
    name = "eth0"
    type = "nic"

    properties = {
      network = "vmbr0"
      hwaddr = var.home_assistant.mac_address
    }
  }
}