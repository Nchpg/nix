{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;

    # Plugins gérés par Nix
    plugins = with pkgs.vimPlugins; [
      gruvbox
      vim-polyglot
      vim-airline
      vim-airline-themes
      vim-wakatime
      vim-fugitive
      vim-gitgutter
      vim-commentary
      nerdtree
      coc-nvim
    ];

    extraConfig = ''
      ${builtins.readFile ./.vimrc}
      execute 'set runtimepath+=' . expand('~/.vim/airline')
    '';
  };

  home.packages = with pkgs; [
    # for coc-nvim
    nodejs

    # font for vim-airline
    powerline-fonts

    ### language servers

    # c
    clang-tools

    #python
    pyright

    # nix
    nil
    nixpkgs-fmt
  ];
  
  home.file = {
    ".vim/airline/autoload/airline/themes/powerline.vim".source = ./powerline.vim;
    ".vim/coc-settings.json".source = ./coc-settings.json;
    ".clang-format".source = ./.clang-format;
  };
}
