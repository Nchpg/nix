{
  #  nbfc | sudo ec_probe write 0xCF 0x11
  description = "Nchpg configuration";

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-stable";
  };

  outputs = inputs@{ self, ... }:
    let
      system = "x86_64-linux";
      
      pkgs-stable = import inputs.nixpkgs-stable {
        inherit system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };

      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };

      lib = inputs.nixpkgs-stable.lib;
      hosts = builtins.filter (x: x != null) (lib.mapAttrsToList (name: value: if (value == "directory") then name else null) (builtins.readDir ./profile));

    in
    {
      nixosConfigurations = builtins.listToAttrs
        (map (host: {
          name = host;
          value = lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              (./profile/${host})

              # system modules
              ./modules/system

              # home manager
              inputs.home-manager.nixosModules.home-manager
              ({ config, ... }: {
                home-manager.extraSpecialArgs = {
                  inherit pkgs-unstable;
                  inherit pkgs-stable;
                  inherit inputs;
                  systemSettings = config.systemSettings; 
                };
              })

            ];
            specialArgs = {
              inherit pkgs-stable;
              inherit inputs;
              homeName = host;
            };
          };
        }) hosts);
    };
}

