{ config, lib, pkgs, ...}:

{
  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;

    extraInputRules = ''
      # Allow SSH only from 192.168.178.67
      iifname "eno1" ip saddr 192.168.178.67 tcp dport 22 accept
    '';
  };
}