{ self, nixpkgs, home-manager,systemSettings, userSettings, ... }:

let
  profileSettings = {
    terminal = "kitty";
    shell = "zsh";
  };
  
  finalSystemSettings = systemSettings // profileSettings;
in
  nixpkgs.lib.nixosSystem {
    inherit (systemSettings) system;

    specialArgs = {
      inherit self userSettings;
      systemSettings = finalSystemSettings; 
    };

    modules = [
      ./configuration.nix

      home-manager.nixosModules.home-manager
      ({ pkgs, ... }:
      {
        nixpkgs.config.allowUnfree = true; 
        home-manager = {
          extraSpecialArgs = {
            inherit self userSettings;
            systemSettings = finalSystemSettings; 
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