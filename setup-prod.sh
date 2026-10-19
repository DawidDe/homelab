#!/bin/bash

# Layer 1: bare metal


# Layer 2: virtualization


# Layer 3: kubernetes
read -p "Enter github token: " GITHUB_TOKEN

flux bootstrap github \
  --owner=dawidde \
  --repository=homelab \
  --branch=main \
  --path=fluxcd/clusters/production \
  --personal
  
kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: vault-token
  namespace: external-secrets-operator
data:
  token:
EOF