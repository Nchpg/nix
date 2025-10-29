{ self, pkgs, lib, config, ... }:
  let
    home_modules = "${self}/modules/user";
  in
{

  home.username = config.systemSettings.user;
  home.homeDirectory = "/home/${config.systemSettings.user}";

  imports = [
    "${home_modules}/vim"
    "${home_modules}/bash"
  ];

  # Common packages for all profiles
  home.packages = with pkgs; [
    tree
    git
  ];

  programs.firefox.enable = true;
  
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

