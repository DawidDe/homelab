{ config, lib, pkgs, ...}:

{
  systemd.tmpfiles.rules = [
    "d /opt/omni 0700 omni omni -"
  ];

  virtualisation.oci-containers.containers.omni = {
    image = "ghcr.io/siderolabs/omni:latest";
    extraOptions = [
      "--read-only"
      "--drop-cap=ALL"
      "--security-opt=no-new-privileges:true"
    ];
    capabilities = {
      NET_ADMIN = true;
    };
    volumes = [
      "./omni.asc:/omni.asc:ro"
      "./config.yaml:/.config.yaml:ro"
      "/opt/omni/sqlite:/_out/sqlite:rw"
      "/opt/omni/etcd:/_out/etcd:rw"
    ];
    command = [
      "--config-path=/config.yaml"
    ];
    devices = [
      "/dev/net/tun:/dev/net/tun"
    ];
    networks = [
      "omni"
    ];
    autoStart = true;
  };
}