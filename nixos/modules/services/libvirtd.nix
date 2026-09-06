{ config, lib, pkgs, ...}:

{
  virtualisation.libvirtd = {
    enable = true;

    unixSockGroup = "libvirt";
    unixSockPerms = "0770";
  };
}