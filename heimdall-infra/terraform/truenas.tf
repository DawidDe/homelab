resource "proxmox_vm_qemu" "truenas" {
    target_node = var.truenas.target_node
    vmid = var.truenas.vmid
    name = var.truenas.name
    onboot = var.truenas.onboot
    agent = var.truenas.agent
    vm_state = var.truenas.vm_state

    bios = var.truenas.bios
    efidisk {
        efitype = var.truenas.efidisk_efitype
        storage = var.truenas.efidisk_storage
        pre_enrolled_keys = var.truenas.pre_enrolled_keys
    }

    disks {
        ide {
            ide2 {
                cdrom {
                    iso = var.truenas.iso
                }
            }
        }
        virtio {
            virtio0 {
                disk {
                    storage = var.truenas.disk_storage
                    size = var.truenas.disk_size
                }
            }
        }
    }

    cpu {
        sockets = var.truenas.cpu_sockets
        cores = var.truenas.cpu_cores
        type = var.truenas.cpu_type
    }

    memory = var.truenas.memory
    balloon = var.truenas.balloon

    network {
        id = var.truenas.network_id
        bridge = var.truenas.network_bridge
        model = var.truenas.network_model
        macaddr = var.truenas.network_macaddr
    }
    ipconfig0 = var.truenas.ipconfig0
    skip_ipv6 = var.truenas.skip_ipv6
}