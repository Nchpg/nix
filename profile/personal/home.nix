{ self, pkgs, userSettings, ... }:
  let
    home_modules = "${self}/home-modules";
  in
{
  imports = [
    "${home_modules}/common.nix"
    "${home_modules}/sway"
    "${home_modules}/foot"
  ];

  # Specific packages for this profile user
  home.packages = [
    pkgs.discord
  ];

}
