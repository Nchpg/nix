{ config, pkgs, lib, systemSettings, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true; 
    history = {
      ignoreDups = true;
      extended = true;
    };
    initContent = builtins.readFile ./.zshrc;
  };


  # Configure shell for terminal emulators
  programs.kitty = lib.mkIf (systemSettings.terminal == "kitty" && systemSettings.shell == "zsh") {
    settings.shell = "${pkgs.zsh}/bin/zsh";
  };

  programs.foot = lib.mkIf (systemSettings.terminal == "foot" && systemSettings.shell == "zsh") {
    settings.main.shell = "${pkgs.zsh}/bin/zsh";
  };
}