{ self, pkgs, userSettings, ... }:
  let
    home_modules = "${self}/home-modules";
  in
{
  imports = [
    (import "${home_modules}/common.nix" { inherit self pkgs userSettings; })
    "${home_modules}/sway"
    "${home_modules}/foot"
  ];

  # Specific packages for this profile user
  home.packages = [
    pkgs.discord
  ];

}
