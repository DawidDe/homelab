{ config, lib, pkgs, ...}:

{
  systemd.tmpfiles.rules = [
    "d /opt/ddns 0700 ddns ddns -"
  ];

  virtualisation.oci-containers.containers.ddns = {
    image = "docker.io/favonia/cloudflare-ddns:latest";
    extraOptions = [
      "--read-only"
      "--drop-cap=ALL"
      "--security-opt=no-new-privileges:true"
    ];
    user = "1003:1003";
    environmentFiles = [
      config.sops.secrets."ddns-env".path
    ];
    autoStart = true;
  };
}