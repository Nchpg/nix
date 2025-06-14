{
  description = "Nchpg configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    systemSettings = {
      profile = "personal";
      system = "x86_64-linux"; 
      timeZone = "Europe/Paris";
      keyboardLayout = "fr";
    };

    userSettings = rec {
      username = "nchpg";
      homeDir = "/home/${username}";
      name = "nathan";
      email = "nathanchampagne49@gmail.com";
    };

    pkgs = nixpkgs.legacyPackages.${systemSettings.system};

  in
  {
    nixosConfigurations.nixos = import ./profile/personal/default.nix { inherit self nixpkgs pkgs home-manager systemSettings userSettings; };
  };
}

