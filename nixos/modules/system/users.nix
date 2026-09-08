{ config, lib, pkgs, ...}:

{
  config = lib.mkMerge [
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
    }

    (lib.mkIf (config.networking.hostName == "pi") {
      users.users = {
        omni = { isSystemUser = true; group = "omni"; uid = 1001; };
        pangolin = { isSystemUser = true; group = "pangolin"; uid = 1002; };
        pocket-id = { isSystemUser = true; group = "pocket-id"; uid = 1003; };
        vault = { isSystemUser = true; group = "vault"; uid = 1004; };
        ddns = { isSystemUser = true; group = "ddns"; uid = 1005; };
      };
      
      users.groups = {
        omni.gid = 1001;
        pangolin.gid = 1002;
        pocket-id.gid = 1003;
        vault.gid = 1004;
        ddns.gid = 1005;
      };
    })
  ];
}