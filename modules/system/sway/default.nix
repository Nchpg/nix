{ pkgs-stable, lib, ... }:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}