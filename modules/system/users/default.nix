{ config, lib, ... }:

{
  options = {
    systemSettings = {
      users = lib.mkOption {
        description = "List of desktop users to create on the system";
        type = lib.types.listOf lib.types.str;
      };
    };
  };
  
  config = {
    users.users = builtins.listToAttrs
      (map (user: {
        name = user;
        value = {
          isNormalUser = true;
          extraGroups = [ "networkmanager" "wheel" "docker"];
          createHome = true;
          description = user;
        };
      }) config.systemSettings.users);
  };
}