{ lib, pkgs-stable, pkgs, ... }:
{
  # Common packages for all profiles
  home.packages = with pkgs-stable; [
    tree
    git
  ];

  # TODO: voir differnce stable et non stable
  programs.firefox.enable = true;
  programs.firefox.package = pkgs-stable.firefox;
  
  # link home-manager with system users
  programs.home-manager.enable = true;

}

