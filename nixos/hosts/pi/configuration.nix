{ config, lib, pkgs, ... }:

{
  imports = [
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

  system.stateVersion = "26.05";
}