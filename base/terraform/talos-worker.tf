resource "proxmox_vm_qemu" "talos-worker" {
    target_node = var.name
    vmid = var.talos_worker.vmid
    name = var.talos_worker.name
    onboot = var.talos_worker.onboot
    agent = var.talos_worker.agent
    vm_state = var.talos_worker.vm_state

    bios = var.talos_worker.bios
    efidisk {
        efitype = var.talos_worker.efidisk_efitype
        storage = var.talos_worker.efidisk_storage
        pre_enrolled_keys = var.talos_worker.pre_enrolled_keys
    }

    disks {
        ide {
            ide2 {
                cdrom {
                    iso = var.talos_worker.iso
                }
            }
        }
        virtio {
            virtio0 {
                disk {
                    storage = var.talos_worker.disk0_storage
                    size = var.talos_worker.disk0_size
                }
            }
            virtio1 {
                disk {
                    storage = var.disk1_storage
                    size = var.disk1_size
                }
            }
        }
    }

    cpu {
        sockets = var.talos_worker.cpu_sockets
        cores = var.talos_worker.cpu_cores
        type = var.talos_worker.cpu_type
    }

    memory = var.talos_worker.memory
    balloon = var.talos_worker.balloon

    network {
        id = var.talos_worker.network_id
        bridge = var.talos_worker.network_bridge
        model = var.talos_worker.network_model
        macaddr = var.talos_worker.network_macaddr
    }
    ipconfig0 = var.talos_worker.ipconfig0
    skip_ipv6 = var.talos_worker.skip_ipv6
}