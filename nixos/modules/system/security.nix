{ config, lib, nixpkgs, ...}:

{
  security.pam.services.sudo.sshAgentAuth = true;
  security.pam.sshAgentAuth.enable = true;
}