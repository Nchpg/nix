{ self, pkgs, userSettings, systemSettings, ... }:
  let
    home_modules = "${self}/home-modules";
  in
{
  imports = [
    "${home_modules}/common.nix"
    "${home_modules}/sway"]
  ++ (builtins.concatMap (t: ["${home_modules}/${t}"]) (builtins.filter (x: x == systemSettings.terminal) ["foot" "kitty"]))
  ++ (builtins.concatMap (t: ["${home_modules}/${t}"]) (builtins.filter (x: x == systemSettings.shell) ["bash" "zsh"]));

  # Specific packages for this profile user
  home.packages = with pkgs; [
    discord
    poetry

    nwg-look
    palenight-theme
    catppuccin-gtk
	  git
    alacritty
    pavucontrol
    tree


    jetbrains.webstorm
    jetbrains.idea-ultimate
    vscode
    jdk24
    rstudio

    nodejs_24
    powerline-fonts
  ];

}
