talos_controlplane = {
    name        = "talos-controlplane"
    cpu_sockets = 1
    cpu_cores   = 4
    cpu_threads = 2
    memory      = 8196
    disk_space  = 20
    mac_address = "BC:24:11:7D:B5:B6"
}

talos_worker = {
    name        = "talos-worker"
    cpu_sockets = 1
    cpu_cores   = 10
    cpu_threads = 5
    memory      = 16384
    disk_space  = 30
    mac_address = "BC:24:11:F4:67:6D"
}

home_assistant = {
    vmid              = 102
    name              = "home-assistant"
    onboot            = true
    agent             = 1
    vm_state          = "running"
    bios              = "ovmf"
    pre_enrolled_keys = false
    efidisk_efitype   = "4m"
    efidisk_storage   = "local-lvm"
    iso               = "local:iso/talos.iso"
    disk0_storage     = "local-lvm"
    disk0_size        = "10G"
    cpu_sockets       = 1
    cpu_cores         = 4
    cpu_type          = "host"
    memory            = 8196
    balloon           = 0
    network_id        = 0
    network_bridge    = "vmbr0"
    network_model     = "virtio"
    network_macaddr   = "BC:24:11:05:5C:9E"
    ipconfig0         = "ip=dhcp"
    skip_ipv6         = true
}