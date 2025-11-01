{ config, lib, pkgs-stable, pkgs-unstable, ... }:

let
  shells = lib.attrNames (lib.filterAttrs (_name: type: type == "directory") (builtins.readDir ./.));
in {
  options = {
    userSettings.shell = {
      default = lib.mkOption {
          type = lib.types.enum shells;
          description = "Shell by default";
      };
      list = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          readOnly = true;
          description = "List of available shells";
      };
    };
  };

  config = {
    userSettings.shell.list = shells;
  };
}