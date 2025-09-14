#!/bin/bash

# 1. Bootstrap servers
ansible-playbook ./base/ansible/playbooks/bootstrap-server.yaml -e "@./heimdall-infra/ansible/vars.yaml"

# 2. Bootstrap proxmox
ansible-playbook ./base/ansible/playbooks/bootstrap-proxmox.yaml -e "@./heimdall-infra/ansible/vars.yaml"

# 3. Terraform
terraform apply \
    --auto-approve \
    -var="VAULT_TOKEN=${vault_token}" \
    -var="name=heimdall"