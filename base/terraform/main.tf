provider "proxmox" {
    pm_api_url = "https://proxmox.${var.domain}/api2/json"
    pm_api_token_id = data.vault_kv_secret_v2.secrets.data["proxmox_api_token_id"]
    pm_api_token_secret = data.vault_kv_secret_v2.secrets.data["proxmox_api_token_secret"]
}

provider "vault" {
    address = "https://vault.${var.domain}"
    token = "${var.vault_token}"
}

data "vault_kv_secret_v2" "secrets" {
    mount = "kv"
    name = "proxmox"
}