{ pkgs, lib, systemSettings, ... }:

{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "monospace:size=16";
      };
    };
  };
}