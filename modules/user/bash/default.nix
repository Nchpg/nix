{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.shell.bash;
in {
  options = {
    userSettings.shell.bash = {
      enable = lib.mkEnableOption "Enable bash";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.bash = {
      enable = true;
      bashrcExtra = (builtins.readFile ./.bashrc);
    };
  };
}

/*{ config, pkgs, lib, ... }:
{


  # Configure shell for terminal emulators
  programs.kitty = lib.mkIf (systemSettings.terminal == "kitty" && systemSettings.shell == "bash") {
    settings.shell = "${pkgs.bash}/bin/bash";
  };

  programs.foot = lib.mkIf (systemSettings.terminal == "foot" && systemSettings.shell == "bash") {
    settings.main.shell = "${pkgs.bash}/bin/bash";
  };
}*/