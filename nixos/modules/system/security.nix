{ config, lib, nixpkgs, ...}:

{
  security.pam.sshAgentAuth.enable = true;

  security.sudo.extraConfig = ''
    Defaults keepEnv += "SSH_AUTH_SOCK"
  '';
}