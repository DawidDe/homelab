{ config, lib, pkgs, ...}:

{
  virtualisation.oci-containers.containers.pocket-id = {
    image = "ghcr.io/pocket-id/pocket-id:v2";
    extraOptions = [
      "--read-only"
      "--drop-cap=ALL"
      "--security-opt=no-new-privileges:true"
    ];
    user = "1003:1003";
    volumes = [
      "/opt/pocket-id/data:/app/data"
    ];
    environmentFiles = [
      "/opt/pocket-id/.env"
    ];
    networks = [
      "pocket-id"
    ];
    autoStart = true;
  };
}