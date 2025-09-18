provider "proxmox" {
    pm_api_url = "https://${data.vault_kv_secret_v2.secrets.data["proxmox_ip"]}:8006/api2/json"
    pm_api_token_id = data.vault_kv_secret_v2.secrets.data["proxmox_api_token_id"]
    pm_api_token_secret = data.vault_kv_secret_v2.secrets.data["proxmox_api_token_secret"]
    pm_tls_insecure = true
}

provider "vault" {
    address = "${var.vault_address}"
    token = "${var.vault_token}"
}

data "vault_kv_secret_v2" "secrets" {
    mount = "kv"
    name = "${var.name}-infra"
}