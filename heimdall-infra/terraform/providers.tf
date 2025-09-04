terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.2-rc04"
    }
    vault = {
      source = "hashicorp/vault"
      version = "5.2.1"
    }
  }
}