{ self, nixpkgs, home-manager,systemSettings, userSettings, ... }:

  nixpkgs.lib.nixosSystem {
    inherit (systemSettings) system;

    specialArgs = {
      inherit self userSettings systemSettings; 
    };

    modules = [
      ./configuration.nix

      home-manager.nixosModules.home-manager
      ({ pkgs, ... }:
      {
        nixpkgs.config.allowUnfree = true; 
        home-manager = {
          extraSpecialArgs = {
            inherit self userSettings systemSettings;
          };
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${userSettings.username}.imports = [
            ./home.nix
          ];
        };
      })
    ];
  }