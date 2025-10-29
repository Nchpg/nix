{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.shell.zsh;
in {
  options = {
    userSettings.shell.zsh = {
      enable = lib.mkEnableOption "Enable zsh";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      history = {
        ignoreDups = true;
        extended = true;
      };
      initContent = builtins.readFile ./.zshrc;
    };
  };
}

/*
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
}*/