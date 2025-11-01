{ config, lib, pkgs-stable, pkgs-unstable, ... }:

let
  cfg = config.userSettings;

  terminals = lib.attrNames (lib.filterAttrs (_name: type: type == "directory") (builtins.readDir ./.));
in {
  options = {
    userSettings.terminal = {
      list = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          readOnly = true;
          description = "List of available terminals";
      };
    };
  };
  config = {
    userSettings.terminal = {
        list = terminals;
    }
    //
    (lib.genAttrs terminals (name:
      lib.mkIf cfg.terminal."${name}".enable {
        shell = "${cfg.shell.default}";
      }
    ));
  };
}