{ inputs, config, lib, pkgs, pkgs-unstable, username, nixpkgs-unstable,  ... }:

let
  php = pkgs.php83.buildEnv { extraConfig = "memory_limit = 4G"; };
in {
  imports = [
    ../modules/fish.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/gennadi";
  home.stateVersion = "23.11";

  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs-unstable.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 28;
    };
  };

  home.pointerCursor = {
      gtk.enable = true;
      name = "BreezeX-RosePine-Linux";
      package = pkgs-unstable.rose-pine-cursor;
      size = 14;
      x11 = {
        enable = true;
        defaultCursor = "BreezeX-RosePine-Linux";
      };
    };

# Required to get the fonts installed by home-manager to be picked up by OS.
  fonts.fontconfig.enable = true;

# See https://discourse.nixos.org/t/home-manager-installed-apps-dont-show-up-in-applications-launcher/8523/2.
  targets.genericLinux.enable = true;

  home.packages = (with pkgs;  [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "VictorMono"  ]; })
    bottom
    bruno
    coreutils
    delta
    dfu-programmer
    du-dust
    evince
    fd
    gcc
    git
    gnumake
    gnupg
    go
    jq
    just
    lazygit
    monaspace
    mysql80
    nodejs_20
    openssl
    php
    phpPackages.composer
    pv
    ripgrep
    symfony-cli
    wl-clipboard
    firefox
    gnome.gnome-tweaks
    gnome-console
    google-chrome
    slack
    spotify
    teams-for-linux
    warp-terminal
  ]) ++ (with pkgs-unstable; [
    rose-pine-cursor
    alacritty
    neovim
    waybar
    hyprland
    _1password-gui
    jetbrains.phpstorm
  ]);

  home.file."${config.xdg.configHome}" = {
    source = ./config;
    recursive = true;
  };

  home.file.".editorconfig".source = ./editorconfig;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    KEYTIMEOUT = 1;
  };

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "GitHub";
      };
    };
    home-manager = {
      enable = true;
    };
    eza = {
      enable = true;
    };
    fzf = {
      enable = true;
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        add_newline = true;
      };
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [ "--cmd cd" ];
    };
  };

#  dconf.settings = {
# };
}
