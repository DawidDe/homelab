#!/bin/bash

# Layer 1: bare metal


# Layer 2: virtualization


# Layer 3: kubernetes
read -p "Enter github token: " GITHUB_TOKEN

helm install cilium cilium/cilium --version 1.20.3 \
   --namespace $CILIUM_NAMESPACE \
   --set ipam.mode=kubernetes \
   --set kubeProxyReplacement=true \
   --set securityContext.capabilities.ciliumAgent="{CHOWN,KILL,NET_ADMIN,NET_RAW,IPC_LOCK,SYS_ADMIN,SYS_RESOURCE,DAC_OVERRIDE,FOWNER,SETGID,SETUID}" \
   --set securityContext.capabilities.cleanCiliumState="{NET_ADMIN,SYS_ADMIN,SYS_RESOURCE}" \
   --set cgroup.autoMount.enabled=false \
   --set cgroup.hostRoot=/sys/fs/cgroup \
   --set k8sServiceHost=localhost \
   --set k8sServicePort=7445

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