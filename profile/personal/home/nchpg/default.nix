{ config, lib, pkgs-stable, pkgs-unstable, ... }:

{
  imports = (lib.optional (builtins.pathExists ./private.nix) ./private.nix);

  config = {
    nixpkgs.config.allowUnfree = true;

    userSettings = lib.mkForce {
      defaultPkgs = pkgs-stable;

      vim = {
        enable = true;
      };

      git = {
        enable = true;
      };

      firefox = {
        enable = true;
      };

      vscode = {
        enable = true;
        pkgs = pkgs-unstable;
      };


      shell = {
        zsh = {
          enable = true;
        };
        bash = {
          enable = true;
        };
        default = "zsh";
      };


      terminal = {
        kitty = {
          enable = true;
        };
        foot = {
          enable = false;
        };
        alacritty = {
          enable = true;
          shell = "bash";
        };
        default = "kitty";
      };
    };
  };
}