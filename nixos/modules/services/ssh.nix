{ config, lib, pkgs, ...}:

{
  services.openssh = {
    enable = true;
    openFirewall = false;

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;

      AllowUsers = [
        "dawid"
      ];

      MaxAuthTries = 3;
    };
  };
}