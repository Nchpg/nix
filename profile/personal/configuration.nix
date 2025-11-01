{ config, ... }:

{
  config = {
    systemSettings = {
      users = [ "nchpg" ];

      window-manager = {
        sway.enable = true;
        gnome.enable = true;
      };
    };
  };
}
