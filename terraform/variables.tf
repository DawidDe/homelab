variable "talos_controlplane" {
    type = object({
        name        = string
        cpu_sockets = number
        cpu_cores   = number
        cpu_threads = number
        memory      = number
        disk_space  = number
        mac_address = string
    })
}

variable "talos_worker" {
    type = object({
        name        = string
        cpu_sockets = number
        cpu_cores   = number
        cpu_threads = number
        memory      = number
        disk_space  = number
        mac_address = string
    })
}

variable "home_assistant" {
    type = object({
        name        = string
        cpu_sockets = number
        cpu_cores   = number
        cpu_threads = number
        memory      = number
        disk_space  = number
        mac_address = string
    })
}