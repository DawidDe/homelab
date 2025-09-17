#!/bin/bash

read -p "Enter vault token: " vault_token

vault_address=https://vault.dawidde.de
name=heimdall

# 1. Bootstrap servers
ansible-playbook ./base/ansible/playbooks/bootstrap-server.yaml \
    -e vault_address=${vault_address} \
    -e vault_token=${vault_token} \
    -e name=${name}

# 2. Bootstrap proxmox
ansible-playbook ./base/ansible/playbooks/bootstrap-proxmox.yaml \
    -e vault_address=${vault_address} \
    -e vault_token=${vault_token} \
    -e name=${name}

# 3. Terraform
terraform apply --auto-approve \
    -var="vault_address=${vault_address}" \
    -var="vault_token=${vault_token}" \
    -var="name=${name}"