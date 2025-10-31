{ config, lib, pkgs-stable, pkgs-unstable, ... }:

let
  cfg = config.userSettings.git;
in {
  options = {
    userSettings.git = {
      enable = lib.mkEnableOption "Enable git";
      pkgs = lib.mkOption {
        type = lib.types.attrs;
        default = pkgs-stable;
        description = "Pkgs to use";
      };
    };
  };
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      package = cfg.pkgs.git;
    };
  };
}