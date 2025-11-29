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

# 4. Bootstrap Kubernetes

# Install ArgoCD
kubectl create namespace argocd
kubectl apply -f base/kubernetes/argocd/configmap.yaml
kubectl apply -f - <<EOF
---
apiVersion: v1
kind: Secret
metadata:
  name: argocd-vault-plugin-secrets
  namespace: argocd
stringData:
  VAULT_ADDR: ""
  AVP_TYPE: "vault"
  AVP_AUTH_TYPE: "approle"
data:
  AVP_ROLE_ID:
  AVP_SECRET_ID:
EOF
helm install argocd argo/argo-cd -n argocd -f argocd-helm-values.yaml

# Install External Secrets Operator
kubectl apply -f base/kubernetes/external-secrets-operator/app.yaml
encoded_vault_token=$(echo -n "$vault_token" | base64)
kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: vault-token
  namespace: external-secrets-operator
data:
  token: ${encoded_vault_token}
EOF

# Install other Apps
kubectl apply -f base/kubernetes/traefik/app.yaml
kubectl apply -f base/kubernetes/cert-manager/app.yaml