{ config, lib, nixpkgs, ...}:

{
  security.pam.sshAgentAuth.enable = true;
  security.pam.services.sudo.sshAgentAuth = true;

  security.sudo.extraConfig = ''
    Defaults env_keep += "SSH_AUTH_SOCK"
  '';

  security.pam.services.sudo.rules.auth.ssh_agent_auth.settings = {
    debug = true;
  };
}