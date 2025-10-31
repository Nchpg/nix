{ config, lib, pkgs-stable, ... }:

let
  cfg = config.systemSettings.window-manager.sway;
in {
  options = {
    systemSettings.window-manager.sway = {
      enable = lib.mkEnableOption "Enable sway window manager";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
    
    home-manager.users = builtins.listToAttrs
      (map (user: {
        name = user;
        value = {
          home.username = user;
          home.homeDirectory = "/home/"+user;
        };
      }) config.systemSettings.users);
  };
}