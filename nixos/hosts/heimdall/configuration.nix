{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix

    # Shared system modules
    ../../modules/system/locale.nix
    ../../modules/system/users.nix

    # Shared services modules
    ../../modules/services/firewall.nix
    ../../modules/services/ssh.nix
    ../../modules/services/libvirtd.nix
  ];

  # Host-specific configurations
  networking.hostName = "heimdall";

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
  };

  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

  boot.initrd = {
    systemd.enable = true;
    kernelModules = [ "tpm_tis" ];
  };

  environment.systemPackages = with pkgs; [
    nano
    htop
    zfs
  ];

  system.stateVersion = "26.05";
}