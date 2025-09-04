#!/bin/bash

cd terraform
terraform apply -auto-approve
cd ..

# Install ArgoCD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Install Argo Apps
kubectl apply -f ./kubernetes/traefik/app.yaml
kubectl apply -f ./kubernetes/cert-manager/app.yaml