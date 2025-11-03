{ config, lib, ... }:

{
  imports = (lib.optional (builtins.pathExists ./private.nix) ./private.nix);

  config = {
    systemSettings = {
      users = [ 
        {
          name = "nchpg";
          isAdmin = true;
          allowDocker = true;
        }
        {
          name = "guest";
          isAdmin = false;
          allowDocker = false;
        }
      ];

      window-manager = {
        sway.enable = true;
        gnome.enable = true;
      };
    };
  };
}
