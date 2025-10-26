{ pkgs, lib, ... }:

let
  marketplaceExtensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "shift-shift";
      publisher = "ahgood";
      version = "0.0.5";
      sha256 = "sha256-r6qzsQTQrTbZiloFdyH5XtT2P2Mf3uOV70iCNuJa6HQ=";
    }
    {
      name = "vscode-postgresql-client2";
      publisher = "cweijan";
      version = "8.4.2";
      sha256 = "sha256-fZa5PpIfYo8FIrEqVIW4uQPRv8tCf9WMLp5jZb1uhno=";
    }
    {
      name = "vscode-containers";
      publisher = "ms-azuretools";
      version = "2.2.0";
      sha256 = "sha256-UxWsu7AU28plnT0QMdpPJrcYZIV09FeC+rmYKf39a6M=";
    }
    {
      name = "vscode-python-envs";
      publisher = "ms-python";
      version = "1.10.0";
      sha256 = "sha256-fhrV9sPjgwp1+ZDMu7iU7To2R0hcAF388w99yCMiHQA=";
    }
    {
      name = "cpptools-themes";
      publisher = "ms-vscode";
      version = "2.0.0";
      sha256 = "sha256-YWA5UsA+cgvI66uB9d9smwghmsqf3vZPFNpSCK+DJxc=";
    }
    {
      name = "remote-explorer";
      publisher = "ms-vscode";
      version = "0.5.0";
      sha256 = "sha256-BNsnetpddxv3Y9MjZERU5jOq1I2g6BNFF1rD7Agpmr8=";
    }
    {
      name = "vscode-nginx";
      publisher = "william-voyek";
      version = "0.7.2";
      sha256 = "sha256-mAmncewwAeagVqwWWrmYosMyw2AT3W0sx8jl2mCeimg=";
    }
    {
      name = "copilot-chat";
      publisher = "github";
      version = "0.31.5";
      sha256 = "sha256-D7k+hA786w7IZHVI+Og6vHGAAohpfpuOmmCcDUU0WsY=";
    }
    {
      name = "copilot";
      publisher = "github";
      version = "1.388.0";
      sha256 = "sha256-7RjK8+PNI+rIuRQfCwpvswAiz991dacRO2qYhcv1vhk=";
    }
  ];


  allVscodeExtensions = with pkgs.vscode-extensions; [
    ms-python.python
    ms-vscode.cpptools
    eamodio.gitlens
    arjun.swagger-viewer
    bbenoist.nix
    cweijan.dbclient-jdbc
    dracula-theme.theme-dracula
    golang.go
    ms-azuretools.vscode-docker
    ms-python.debugpy
    ms-python.python
    ms-python.vscode-pylance
    ms-toolsai.jupyter-keymap
    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-ssh-edit
    ms-vscode.cmake-tools
    ms-vscode.cpptools
    ms-vscode.cpptools-extension-pack
    ms-vscode.makefile-tools
    ocamllabs.ocaml-platform
    pkief.material-icon-theme
    redhat.vscode-yaml
    ritwickdey.liveserver
    usernamehw.errorlens
    vscodevim.vim
  ] ++ marketplaceExtensions;

in
{
  home.packages = [
    (pkgs.vscode-with-extensions.override {
      vscodeExtensions = allVscodeExtensions;
    })
  ];

  home.file.".config/Code/User/settings.json".source = ./settings.json;
}