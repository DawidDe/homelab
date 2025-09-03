resource "proxmox_vm_qemu" "talos-controlplane" {
    target_node = var.talos_controlplane.target_node
    vmid = var.talos_controlplane.vmid
    name = var.talos_controlplane.name
    onboot = var.talos_controlplane.onboot
    agent = var.talos_controlplane.agent

    bios = var.talos_controlplane.bios
    pre_enrolled_keys = var.talos_controlplane.pre_enrolled_keys
    efidisk {
        efitype = var.talos_controlplane.efidisk_efitype
        storage = var.talos_controlplane.efidisk_storage
    }

    disks {
        ide {
            ide2 {
                cdrom {
                    iso = var.talos_controlplane.iso
                }
            }
        }
        virtio {
            virtio0 {
                disk {
                    storage = var.talos_controlplane.disk_storage
                    size = var.talos_controlplane.disk_size
                }
            }
        }
    }

    cpu {
        sockets = var.talos_controlplane.cpu_sockets
        cores = var.talos_controlplane.cpu_cores
        type = var.talos_controlplane.cpu_type
    }

    memory = var.talos_controlplane.memory
    balloon = var.talos_controlplane.balloon

    network {
        id = var.talos_controlplane.network_id
        bridge = var.talos_controlplane.network_bridge
        model = var.talos_controlplane.network_model
        macaddr = var.talos_controlplane.network_macaddr
    }
    ipconfig0 = var.talos_controlplane.ipconfig0
}