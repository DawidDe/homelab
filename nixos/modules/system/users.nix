{ config, lib, pkgs, ...}:

{
  users.users = {
    dawid = {
      createHome = true;
      extraGroups = [
        "wheel"
      ];
      group = "users";
      home = "/home/dawid";
      isSystemUser = true;

      openssh.authorizedKeys.keys = [
          "sk-ecdsa-sha2-nistp256@openssh.com AAAAInNrLWVjZHNhLXNoYTItbmlzdHAyNTZAb3BlbnNzaC5jb20AAAAIbmlzdHAyNTYAAABBBKzkzCs5JnFDhBB7YAmnzcd0S6tbMsV1XGJ3B4aod+TdJUI0ngLLyFQxJVpXivExqqHUtPH14HdpV5qWVx5NnV4AAAALdGVybWl1cy5jb20="
      ];
    };
  };
}