ui = true

storage "raft" {
    path = "/vault/data"
    node_id = "vault"
}

listener "tcp" {
    address = "0.0.0.0:8200"
    tls_disable = 1
}

api_addr = "https://vault.dawidde.de"
cluster_addr = "https://vault.dawidde.de:8201"
disable_mlock = false