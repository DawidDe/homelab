{ config, lib, nixpkgs, ...}:

{
  security.pam.sshAgentAuth.enable = true;
  security.pam.services.sudo.sshAgentAuth = true;
}