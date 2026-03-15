#!/bin/bash

talosctl gen config bootstrap https://$CONTROL_PLANE_IP:6443

sleep 60

talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file controlplane.yaml
talosctl --talosconfig=./talosconfig config endpoints $CONTROL_PLANE_IP

sleep 60

talosctl bootstrap --nodes $CONTROL_PLANE_IP --talosconfig=./talosconfig

sleep 60

talosctl kubeconfig --nodes $CONTROL_PLANE_IP --talosconfig=./talosconfig