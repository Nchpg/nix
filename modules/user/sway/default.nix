{ pkgs, lib, ... }:


let
  # Edit config template terminal
  #terminalPkg = lib.getAttr systemSettings.terminal pkgs;
  templateContent = builtins.readFile ./sway-config/config.template;
  finalConfigContent = lib.replaceStrings ["@terminal@"] ["kitty"] templateContent;
in
{
  home.file.".config/sway/config" = {
    text = finalConfigContent;
  };

  home.file.".config/sway/brightness.sh" = {
    source = ./sway-config/brightness.sh;
    executable = true;
  };

  home.file.".config/sway/sway-bar.sh" = {
    source = ./sway-config/sway-bar.sh;
    executable = true;
  };

  home.file.".config/sway/wallpaper.png".source = ./sway-config/wallpaper.png;

  
  home.packages = [
    #terminalPkg
    pkgs.kitty
    pkgs.dmenu # mod + d menu

    # Sway bar dependencies
    pkgs.acpi # Power battery 
    pkgs.alsa-utils # Sound
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
