# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ self, config, pkgs, systemSettings, userSettings, ... }:
  let
    sys_modules = "${self}/sys-modules";
  in
{
  imports =
    [
      ./hardware-configuration.nix
      "${sys_modules}/common.nix"
      "${sys_modules}/sway"
      "${sys_modules}/gnome"
    ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # GPU
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
    options = "numpad:mac";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Define the user
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.username;
    extraGroups = [ "networkmanager" "wheel" "docker"];
  };

  # Enable thunar
  programs.thunar.enable = true;

  # Enable automatic garbage collection
  nix.gc = {
    automatic = true; # Run the garbage collector automatically
    dates = "weekly"; # How often to run it
    options = "--delete-older-than 14d"; # What to delete
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
