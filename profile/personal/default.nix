{ config, ... }:

{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
  ];

  config = {
    home-manager.users = builtins.listToAttrs
      (map (user: { name = user.name; value =
                      { imports = [ ./home/${user.name} ../../modules/user ]; };}) config.systemSettings.users);
    };
}