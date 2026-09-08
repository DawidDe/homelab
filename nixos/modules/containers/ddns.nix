{ config, lib, pkgs, ...}:

{
  virtualisation.oci-containers.containers.ddns = {
    image = "docker.io/favonia/cloudflare-ddns:latest";
    extraOptions = [
      "--read-only"
      "--drop-cap=ALL"
      "--security-opt=no-new-privileges:true"
    ];
    user = "1003:1003";
    environmentFiles = [
      "/opt/ddns/.env"
    ];
    autoStart = true;
  };
}