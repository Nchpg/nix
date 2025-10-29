{ config, lib, pkgs, ... }:

let
  cfg = config.userSettings.terminal.foot;
in {
  options = {
    userSettings.terminal.foot = {
      enable = lib.mkEnableOption "Enable foot terminal";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.foot = {
      enable = true;

      settings = {
        main = {
          font = "monospace:size=16";
        };
      };
    };
  };
}