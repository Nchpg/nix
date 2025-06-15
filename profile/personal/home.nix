{ self, pkgs, userSettings, systemSettings, ... }:
  let
    home_modules = "${self}/home-modules";
  in
{
  imports = [
    "${home_modules}/common.nix"
  ] 
  ++ (if systemSettings.display_manager == "sway" then ["${home_modules}/sway"] else [])
  ++ (if systemSettings.terminal == "foot" then ["${home_modules}/foot"] else []);

  # Specific packages for this profile user
  home.packages = [
    pkgs.discord
  ];

}
