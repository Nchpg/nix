# ~/.config/nixpkgs/home.nix ou votre module Home Manager

{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;

    # Traduit directement la configuration en attributs Nix.
    # Les chaînes de caractères ne nécessitent pas de guillemets 
    # si elles sont composées uniquement de caractères alphanumériques/spéciaux simples.
    # Les valeurs hexadécimales de couleur doivent être des chaînes de caractères.
    settings = {
      # Usability
      confirm_os_window_close = 0;
      window_padding_width = 4;
      term = "xterm-256color";

      # Keymap - Ces options sont mieux gérées par 'extraConfig' ou 'keybindings'
      # car elles utilisent la syntaxe 'map' qui n'est pas un simple attribut.
      # Cependant, Home Manager peut convertir certaines d'entre elles.
      # Pour être sûr, nous allons les mettre dans extraConfig.

      # Tabs
      tab_bar_min_tabs = 2;
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      tab_title_template = "{title}{' :{}: - kitty'.format(num_windows) if num_windows > 1 else 'kitty'}";

      # Appearance
      font_family = "JetBrainsMono Nerd Font";
      font_size = 16.0;

      ## Animate cursor (La traînée de curseur est bien là !)
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4"; # Notez que c'est une chaîne en Home Manager
      cursor_shape = "block";

      ## The basic colors
      foreground = "#cdd6f4";
      background = "#262626";
      selection_foreground = "#1e1e2e";
      selection_background = "#f5e0dc";

      ## Cursor colors
      cursor = "#f5e0dc";
      cursor_text_color = "#1e1e2e";

      ## URL underline color when hovering with mouse
      url_color = "#f5e0dc";

      ## Kitty window border colors
      active_border_color = "#b4befe";
      inactive_border_color = "#6c7086";
      bell_border_color = "#f9e2af";

      ## OS Window titlebar colors
      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";

      ## Tab bar colors
      active_tab_foreground = "#11111b";
      active_tab_background = "#cba6f7";
      inactive_tab_foreground = "#cdd6f4";
      inactive_tab_background = "#181825";
      tab_bar_background = "#11111b";

      ## Colors for marks
      mark1_foreground = "#1e1e2e";
      mark1_background = "#b4befe";
      mark2_foreground = "#1e1e2e";
      mark2_background = "#cba6f7";
      mark3_foreground = "#1e1e2e";
      mark3_background = "#74c7ec";

      ## The 16 terminal colors
      color0 = "#45475a";
      color8 = "#585b70";
      color1 = "#ff6b81"; # red
      color9 = "#f38ba8";
      color2 = "#85ef47"; # green
      color10 = "#a6e3a1";
      color3 = "#ffe66d"; # yellow
      color11 = "#f9e2af";
      color4 = "#5bc0eb"; # blue
      color12 = "#89b4fa";
      color5 = "#d65db1"; # magenta
      color13 = "#f5c2e7";
      color6 = "#39c9a3"; # cyan
      color14 = "#94e2d5";
      color7 = "#bac2de";
      color15 = "#a6adc8";

    };

    # Ajout des raccourcis clavier dans extraConfig car 'map' n'est pas un simple paramètre 'setting'
    extraConfig = ''
      bell none
      enable_audio_bell no
      map ctrl+equal change_font_size all +2.0
      map ctrl+minus change_font_size all -2.0
      map ctrl+c copy_or_interrupt
      map ctrl+alt+c copy_to_clipboard
      map ctrl+shift+v paste_from_clipboard
      map ctrl+v paste_from_clipboard
    '';
  };
}