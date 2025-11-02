{ config, lib, pkgs-stable, pkgs-unstable, ... }:

{
  imports = (lib.optional (builtins.pathExists ./private.nix) ./private.nix);

  config = {
    nixpkgs.config.allowUnfree = true;

    userSettings = lib.mkForce {
      defaultPkgs = pkgs-stable;

      vim.enable = true;

      git.enable = true;

      shell = {
        zsh.enable = true;
        bash.enable = true;
      };
    };
  };
}