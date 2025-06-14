{ self, nixpkgs, pkgs, home-manager,systemSettings, userSettings, ... }:

  nixpkgs.lib.nixosSystem {
    inherit (systemSettings) system;
    modules = [
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${userSettings.username}.imports = [
          (import ./home.nix { inherit self pkgs userSettings; })
        ];
      }
    ];
  }