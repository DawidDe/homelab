provider "proxmox" {
    pm_api_url = data.vault_kv_secret_v2.secrets.data["proxmox_api_url"]
    pm_api_token_id = data.vault_kv_secret_v2.secrets.data["proxmox_api_token_id"]
    pm_api_token_secret = data.vault_kv_secret_v2.secrets.data["proxmox_api_token_secret"]
    pm_tls_insecure = true
}

provider "vault" {
    address = "https://vault.dawidde.de"
}

data "vault_kv_secret_v2" "secrets" {
    mount = "kv"
    name = "heimdall-infra"
}