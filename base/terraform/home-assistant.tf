resource "proxmox_vm_qemu" "home-assistant" {
    target_node = var.name
    vmid = var.home_assistant.vmid
    name = var.home_assistant.name
    onboot = var.home_assistant.onboot
    agent = var.home_assistant.agent
    vm_state = var.home_assistant.vm_state

    bios = var.home_assistant.bios
    efidisk {
        efitype = var.home_assistant.efidisk_efitype
        storage = var.home_assistant.efidisk_storage
        pre_enrolled_keys = var.home_assistant.pre_enrolled_keys
    }

    disks {
        ide {
            ide2 {
                cdrom {
                    iso = var.home_assistant.iso
                }
            }
        }
        virtio {
            virtio0 {
                disk {
                    storage = var.home_assistant.disk0_storage
                    size = var.home_assistant.disk0_size
                }
            }
        }
    }

    cpu {
        sockets = var.home_assistant.cpu_sockets
        cores = var.home_assistant.cpu_cores
        type = var.home_assistant.cpu_type
    }

    memory = var.home_assistant.memory
    balloon = var.home_assistant.balloon

    network {
        id = var.home_assistant.network_id
        bridge = var.home_assistant.network_bridge
        model = var.home_assistant.network_model
        macaddr = var.home_assistant.network_macaddr
    }
    ipconfig0 = var.home_assistant.ipconfig0
    skip_ipv6 = var.home_assistant.skip_ipv6
}