terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.2-rc01"
    }
  }
}

provider "proxmox" {
    pm_api_url = var.proxmox.api_url
    pm_api_token_id = var.proxmox.api_token_id
    pm_api_token_secret = var.proxmox.api_token_secret
    pm_tls_insecure = var.proxmox.tls_insecure
}