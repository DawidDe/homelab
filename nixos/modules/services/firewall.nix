{ config, lib, pkgs, ...}:

{
  networking.firewall = {
    enable = true;

    extraInputRules = ''
      # Allow SSH only from 192.168.178.67
      iif eno1 tcp ip saddr 192.168.178.67/32 tcp dport 22 accept
    '';
  };
}