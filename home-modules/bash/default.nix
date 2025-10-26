{ config, pkgs, lib, systemSettings, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = (builtins.readFile ./.bashrc);
  };


  # Configure shell for terminal emulators
  programs.kitty = lib.mkIf (systemSettings.terminal == "kitty" && systemSettings.shell == "bash") {
    settings.shell = "${pkgs.bash}/bin/bash";
  };

  programs.foot = lib.mkIf (systemSettings.terminal == "foot" && systemSettings.shell == "bash") {
    settings.main.shell = "${pkgs.bash}/bin/bash";
  };
}