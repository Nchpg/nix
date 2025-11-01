{ config, lib, pkgs-stable, pkgs-unstable, ... }:

{
  imports = (lib.optional (builtins.pathExists ./private.nix) ./private.nix);

  config = {
    nixpkgs.config.allowUnfree = true;

    userSettings = lib.mkForce {
      vim = {
        enable = true;
        pkgs = pkgs-unstable;
      };
      git = {
        enable = true;
        pkgs = pkgs-unstable;
      };
      firefox = {
        enable = true;
        pkgs = pkgs-unstable;
      };
      vscode = {
        enable = true;
        pkgs = pkgs-unstable;
      };
      shell = {
        zsh = {
          enable = true;
          pkgs = pkgs-unstable;
        };
        bash = {
          enable = true;
          pkgs = pkgs-unstable;
        };
        default = "zsh";
      };
      terminal = {
        kitty = {
          enable = true;
          pkgs = pkgs-unstable;
        };
        foot = {
          enable = true;
          pkgs = pkgs-unstable;
        };
        #default = "kitty";
      };
    };
  };
}