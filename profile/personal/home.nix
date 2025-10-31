{ pkgs-stable, pkgs-unstable, ... }:

{
  config = {
    nixpkgs.config.allowUnfree = true;

    userSettings = {
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
        #default = "zsh";
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