{ config, pkgs, ... }:

{
  
  # > To change terminal and mod go to sway-config/config

  home.file.".config/sway" = {
    source = ./sway-config;
    recursive = true; 
    executable = true;
  };
  
  home.packages = [
    pkgs.dmenu # mod + d menu

    # Sway bar dependencies
    pkgs.acpi # Power battery 
    pkgs.alsa-utils # SOund
    pkgs.light # Brightness
    pkgs.playerctl # Audio player

    # Screenshot
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard

    # Lock screen
    pkgs.swaylock-effects
  ];

}
