{ config, lib, pkgs, ...}:

{
  users.users = {
    dawid = {
      createHome = true;
      extraGroups = [
        "wheel"
        "incus-admin"
      ];
      group = "users";
      home = "/home/dawid";
      isNormalUser = true;
      shell = pkgs.bash;

      openssh.authorizedKeys.keys = [
          "sk-ecdsa-sha2-nistp256@openssh.com AAAAInNrLWVjZHNhLXNoYTItbmlzdHAyNTZAb3BlbnNzaC5jb20AAAAIbmlzdHAyNTYAAABBBKzkzCs5JnFDhBB7YAmnzcd0S6tbMsV1XGJ3B4aod+TdJUI0ngLLyFQxJVpXivExqqHUtPH14HdpV5qWVx5NnV4AAAALdGVybWl1cy5jb20="
      ];
    };
  };

  config = lib.mkIf (config.networking.hostName == "pi") {
    users.users = {
      omni = { isSystemUser = true; group = "omni"; uid = 1001; };
      pangolin = { isSystemUser = true; group = "pangolin"; uid = 1002; };
      pocket-id = { isSystemUser = true; group = "pocket-id"; uid = 1003; };
      vault = { isSystemUser = true; group = "vault"; uid = 1004; };
    };
    
    users.groups = {
      omni.gid = 1001;
      pangolin.gid = 1002;
      pocket-id.gid = 1003;
      vault.gid = 1004;
    };

    systemd.tmpfiles.rules = [
      "d /opt/omni 0750 omni omni -"
      "d /opt/pangolin 0750 pangolin pangolin -"
      "d /opt/pocket-id 0750 pocket-id pocket-id -"
      "d /opt/vault 0750 vault vault -"
    ];
  };
}