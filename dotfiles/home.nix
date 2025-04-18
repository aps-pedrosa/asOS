{ config, pkgs, inputs, ... }:

{
  imports = [
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk;
    };
  };
  home.username = "aether";
  home.homeDirectory = "/home/aether";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    vscode
    spicetify-cli
    gcc
    gdb
    fzf
    nodejs_23
    brightnessctl
    acpi
    mpv
    pavucontrol
    blueman
    networkmanagerapplet
    kitty
    bibata-cursors
    obsidian
    unzip
    grim
    slurp
    spotify
    fd
    tree-sitter
    gnumake
    luajit
    bat
    python3
    fish
    yarn

    # hyprland
    hyprlock
    dunst
    swayidle
    waybar
    wlogout
    hyprpaper
    feh
    albert
    seahorse
    gnome.gnome-keyring

    wireplumber
    libgtop
    bluez
    bluez-tools
    networkmanager
    dart-sass
    wl-clipboard
    upower
    gvfs
    wofi

    # cli
    cava
    btop
    cmatrix
    ncdu
    yazi
    pipes
    hollywood
    cbonsai
    neofetch
    fastfetch
    tmux
    curl
    lazygit
    ripgrep
    glow

    # coding
    lua-language-server
  ];

  home.pointerCursor = {
    name = "Bibata-Modern-Amber";
    package = pkgs.bibata-cursors;
    size = 18;
  };

  programs.neovim.enable = false;
  programs.wezterm.enable = true;
  programs.tofi.enable = true;

  programs.vscode = {
    enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    settings = {
      global = {
        # Display
        monitor = 0;
        follow = "mouse";
        indicate_hidden = "yes";
        shrink = "no";
        transparency = 15;
        separator_height = 2;
        padding = 12;
        horizontal_padding = 12;
        frame_width = 2;
        frame_color = "#fab387";
        separator_color = "#45475a";
        sort = "yes";
        idle_threshold = 120;

        # Text
        font = "JetBrains Mono 10";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        word_wrap = "yes";
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";

        # Icons
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 64;
        
        # History
        sticky_history = "yes";
        history_length = 50;

        # Misc/Advanced
        browser = "firefox";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 12;
        ignore_dbusclose = false;

        # Wayland
        force_xwayland = false;
        force_xinerama = false;

        # Mouse
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";

        # Progress bar
        progress_bar = true;
        progress_bar_height = 6;
        progress_bar_frame_width = 0;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
      };
      
      experimental = {
        per_monitor_dpi = false;
      };
      
      urgency_low = {
        background = "#1e1e2eDD";
        foreground = "#cdd6f4";
        frame_color = "#fab387";
        timeout = 8;
      };
      
      urgency_normal = {
        background = "#1e1e2eDD";
        foreground = "#cdd6f4";
        frame_color = "#fab387";
        timeout = 8;
      };
      
      urgency_critical = {
        background = "#1e1e2eDD";
        foreground = "#cdd6f4";
        frame_color = "#f38ba8";
        timeout = 0;
      };
      
      # App-specific settings
      discord = {
        appname = "Discord";
        icon_position = "off";
      };
      
      spotify = {
        appname = "Spotify";
        format = "<b>Now Playing:</b> %s\n%b";
        timeout = 5;
      };
      
      calendar = {
        summary = "*Calendar*";
        format = "<b>Calendar</b>\n%s\n%b";
        timeout = 10;
      };
      
      download_complete = {
        summary = "*Download Complete*";
        format = "%s\n%b";
        timeout = 5;
      };
      
      firefox = {
        appname = "Firefox";
        timeout = 6;
      };
    };
  };

  home.file = {
    ".config".enable = false;
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    GTK_USE_PORTAL = "1";
  };
}
