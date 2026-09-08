{ config, lib, pkgs, ...}:

{
  systemd.tmpfiles.rules = [
    "d /opt/vault 0700 vault vault -"
  ];

  virtualisation.oci-containers.containers.vault = {
    image = "docker.io/hashicorp/vault:latest";
    extraOptions = [
      "--read-only"
      "--drop-cap=ALL"
      "--security-opt=no-new-privileges:true"
    ];
    user = "1004:1004";
    capabilities = {
      IPC_LOCK = true;
    };
    volumes = [
      "./config.hcl:/vault/config/config.hcl:ro"
      "/opt/vault/data:/vault/data"
      "/opt/vault/logs:/vault/logs"
    ];
    environment = {
      SKIP_CHOWN = true;
      SKIP_SETCAP = true;
    };
    networks = [
      "vault"
    ];
    command = [
      "vault"
    ];
    autoStart = true;
  };
}