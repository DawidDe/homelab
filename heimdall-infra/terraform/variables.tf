variable "talos_controlplane" {
    type = object({
        target_node       = string
        vmid              = number
        name              = string
        onboot            = bool
        agent             = number
        vm_state          = string
        bios              = string
        pre_enrolled_keys = bool
        efidisk_efitype   = string
        efidisk_storage   = string
        iso               = string
        disk_storage      = string
        disk_size         = string
        cpu_sockets       = number
        cpu_cores         = number
        cpu_type          = string
        memory            = number
        balloon           = number
        network_id        = number
        network_bridge    = string
        network_model     = string
        network_macaddr   = string
        ipconfig0         = string
    })
}

variable "talos_worker" {
    type = object({
        target_node       = string
        vmid              = number
        name              = string
        onboot            = bool
        agent             = number
        vm_state          = string
        bios              = string
        pre_enrolled_keys = bool
        efidisk_efitype   = string
        efidisk_storage   = string
        iso               = string
        disk_storage      = string
        disk_size         = string
        cpu_sockets       = number
        cpu_cores         = number
        cpu_type          = string
        memory            = number
        balloon           = number
        network_id        = number
        network_bridge    = string
        network_model     = string
        network_macaddr   = string
        ipconfig0         = string
    })
}