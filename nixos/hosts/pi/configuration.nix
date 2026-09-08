{ config, lib, pkgs, ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops

    # Shared system modules
    ../../modules/system/locale.nix
    ../../modules/system/users.nix

    # Shared services modules
    ../../modules/services/firewall.nix
    ../../modules/services/ssh.nix
    ../../modules/services/podman.nix
  ];

  # Host-specific configurations
  networking.hostName = "pi";

  environment.systemPackages = with pkgs; [
    nano
    htop
  ];

  sops = {
    age.keyFile = "/var/lib/sops-nix/key.txt";
    age.generateKey = false;

    secrets = {
      "ddns-env" = {
        sopsFile = ../../secrets/ddns.env;
        format = "dotenv";
      };
      "pangolin-env" = {
        sopsFile = ../../secrets/pangolin.env;
        format = "dotenv";
      };
      "pocket-id-env" = {
        sopsFile = ../../secrets/pocket-id.env;
        format = "dotenv";
      };
    };
  };

  system.stateVersion = "26.05";
}