#!/bin/bash

talosctl gen config bootstrap https://$CONTROL_PLANE_IP:6443

sleep 60

talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file controlplane.yaml
talosctl --talosconfig=./talosconfig config endpoints $CONTROL_PLANE_IP

sleep 60

talosctl bootstrap --nodes $CONTROL_PLANE_IP --talosconfig=./talosconfig

sleep 60

talosctl kubeconfig --nodes $CONTROL_PLANE_IP --talosconfig=./talosconfig

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml --server-side --force-conflicts

kubectl apply -f base/kubernetes/bootstrap/external-secrets-operator/app.yaml

kubectl apply -f base/kubernetes/bootstrap/external-secrets-operator/app.yaml
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