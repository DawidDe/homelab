#!/bin/bash

# vault section
read -p "Enter vault token: " vault_token
read -p "Enter domain": domain

name=heimdall

# Install ArgoCD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml --server-side --force-conflicts

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