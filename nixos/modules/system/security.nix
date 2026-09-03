{ config, lib, nixpkgs, ...}:

{
  security.pam.services.sudo.sshAgentAuth = true;

  security.pam.sshAgentAuth = {
    enable = true;
    authorizedKeysFiles = [
      "/etc/ssh/authorized_keys.d/%u"
    ];
  };
}