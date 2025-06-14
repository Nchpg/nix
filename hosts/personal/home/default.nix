{ pkgs, userSettings, ... }: {
  imports = [
    ../../../home
  ];

  home.username = userSettings.username;
  home.homeDirectory = userSettings.homeDir;
}
