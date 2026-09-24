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
    name        = "talos-worker"
    cpu_sockets = 1
    cpu_cores   = 4
    cpu_threads = 8
    memory      = 8192
    disk_space  = 30
    mac_address = ""
}