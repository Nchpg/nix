{ lib, pkgs-stable, ... }:
{
  # Common packages for all profiles
  home.packages = with pkgs-stable; [
    tree
    git
  ];

  # TODO: voir differnce stable et non stable
  programs.firefox.package = pkgs-stable.firefox;
  
  # link home-manager with system users
  programs.home-manager.enable = true;

}

