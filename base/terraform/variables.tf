variable "name" {
    type = string
}

variable "vault_address" {
    type = string
}

variable "vault_token" {
    type = string
}

variable "talos_controlplane" {
    type = object({
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
        skip_ipv6         = bool
    })
}

variable "talos_worker" {
    type = object({
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
        skip_ipv6         = bool
    })
}

variable "home_assistant" {
    type = object({
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
        skip_ipv6         = bool
    })
}