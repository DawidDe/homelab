resource "incus_instance" "talos-worker" {
  type = "virtual-machine"
  name = "talos-worker"

  config = {

    # Resource Settings
    "limits.cpu" = "sockets=${var.talos_worker.cpu_sockets},cores=${var.talos_worker.cpu_cores},threads=${var.talos_worker.cpu_threads}"
    "limits.memory" = "${var.talos_worker.memory}MiB"
  }

  device {
    name = "iso"
    type = "disk"

    properties = {
      source = "/home/dawid/talos.iso"
      readonly = true
      "boot.priority" = 9
    }
  }

  device {
    name = "root"
    type = "disk"

    properties = {
      pool = "vm-disks"
      path = "/"
      size = "${var.talos_worker.disk_space}GiB"
      "boot.priority" = 10
    }
  }

  device {
    name = "eth0"
    type = "nic"

    properties = {
      network = "vmbr0"
      hwaddr = var.talos_worker.mac_address
    }
  }
}