proxmox = {
    api_url          = data.vault_kv_secret_v2.heimdall_infra.data["proxmox_api_url"]
    api_token_id     = data.vault_kv_secret_v2.heimdall_infra.data["proxmox_api_token_id"]
    api_token_secret = data.vault_kv_secret_v2.heimdall_infra.data["proxmox_api_token_"]
    tls_insecure     = true
}

talos_controlplane = {
    target_node       = "heimdall"
    vmid              = 100
    name              = "talos-controlplane"
    onboot            = true
    agent             = 1
    vm_state          = "running"
    bios              = "ovmf"
    pre_enrolled_keys = false
    efidisk_efitype   = "4m"
    efidisk_storage   = "local-lvm"
    iso               = "local:iso/talos.iso"
    disk_storage      = "local-lvm"
    disk_size         = "10G"
    cpu_sockets       = 1
    cpu_cores         = 2
    cpu_type          = "host"
    memory            = 4096
    balloon           = 0
    network_id        = 0
    network_bridge    = "vmbr0"
    network_model     = "virtio"
    network_macaddr   = "BC:24:11:7D:B5:B6"
    ipconfig0         = "ip=dhcp"
}

talos_worker = {
    target_node       = "heimdall"
    vmid              = 101
    name              = "talos-worker"
    onboot            = true
    agent             = 1
    vm_state          = "running"
    bios              = "ovmf"
    pre_enrolled_keys = false
    efidisk_efitype   = "4m"
    efidisk_storage   = "local-lvm"
    iso               = "local:iso/talos.iso"
    disk_storage      = "local-lvm"
    disk_size         = "10G"
    cpu_sockets       = 1
    cpu_cores         = 6
    cpu_type          = "host"
    memory            = 16384
    balloon           = 0
    network_id        = 0
    network_bridge    = "vmbr0"
    network_model     = "virtio"
    network_macaddr   = "BC:24:11:F4:67:6D"
    ipconfig0         = "ip=dhcp"
}