{ self, nixpkgs, home-manager,systemSettings, userSettings, ... }:

  nixpkgs.lib.nixosSystem {
    inherit (systemSettings) system;

    specialArgs = {
      inherit self userSettings; 
    };

    modules = [
      ./configuration.nix

      home-manager.nixosModules.home-manager
      ({ pkgs, ... }:
      {
        nixpkgs.config.allowUnfree = true; 
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${userSettings.username}.imports = [
            (import ./home.nix { inherit self pkgs userSettings; })
          ];
        };
      })
    ];
  }