{ self, pkgs, userSettings, ... }:
  let
    home_modules = "${self}/home-modules";
  in
{

  home.username = userSettings.username;
  home.homeDirectory = userSettings.homeDir;

  imports = [
    "${home_modules}/vim"
    "${home_modules}/bash"
  ];

  # Commo packages for all profiles
  home.packages = [
    pkgs.bat
    pkgs.wget
    pkgs.btop
    pkgs.python311
  ];

  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}

