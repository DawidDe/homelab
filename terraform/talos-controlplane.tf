resource "incus_instance" "talos-controlplane" {
  type = "virtual-machine"
  name = "talos-controlplane"

  config = {

    # Resource Settings
    "limits.cpu" = "sockets=${var.talos_controlplane.cpu_sockets},cores=${var.talos_controlplane.cpu_cores},threads=${var.talos_controlplane.cpu_threads}"
    "limits.memory" = "${var.talos_controlplane.memory}MiB"
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
      size = "${var.talos_controlplane.disk_space}GiB"
      "boot.priority" = 10
    }
  }

  device {
    name = "eth0"
    type = "nic"

    properties = {
      network = "vmbr0"
      hwaddr = var.talos_controlplane.mac_address
    }
  }
}