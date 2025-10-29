{ pkgs, lib, config, ... }:
{
  options = {
    userSettings = {
      shell = {
        enable = lib.mkEnableOption "Enable user's shell configuration (bash/zsh)";
      };
      vim = {
        enable = lib.mkEnableOption "Enable user's Vim configuration";
      };
    };
  };


  imports = [
    ./vim
    ./bash
  ];
  config = {
  home.username = "nchpg";
  home.homeDirectory = "/home/nchpg";


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
  };
}

