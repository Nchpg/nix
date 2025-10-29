{ ... }:

{
  config = {

    userSettings = {
      vim.enable = true;
      shell = {
        zsh.enable = true;
        bash.enable = true;
        #default = "zsh";
      };
      terminal = {
        kitty.enable = true;
        foot.enable = true;
        #default = "kitty";
      };
    };
  };
}

# { self, pkgs, userSettings, systemSettings, ... }:
#   let
#     home_modules = "${self}/home-modules";
#   in
# {
#   imports = [
#     "${home_modules}/common.nix"
#     "${home_modules}/sway"
#     "${home_modules}/vscode"
#   ]
#   ++ (builtins.concatMap (t: ["${home_modules}/${t}"]) (builtins.filter (x: x == systemSettings.terminal) ["foot" "kitty"]))
#   ++ (builtins.concatMap (t: ["${home_modules}/${t}"]) (builtins.filter (x: x == systemSettings.shell) ["bash" "zsh"]));

#   # Specific packages for this profile user
#   home.packages = with pkgs; [
#     discord
#     poetry

#     nwg-look
#     palenight-theme
#     catppuccin-gtk
#     alacritty
#     pavucontrol


#     jetbrains.webstorm
#     jetbrains.idea-ultimate
#     jdk24
#     rstudio

#     python311

#     bat
#     wget
#     btop
#   ];

# }
