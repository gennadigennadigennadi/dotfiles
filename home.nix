{ config, lib, pkgs, ... }:

let
    php = pkgs.php83.buildEnv { extraConfig = "memory_limit = 4G"; };
    fish = import ./fish.nix;
    tmux = import ./tmux.nix;
in {
    nixpkgs.config.allowUnfree = true;

    home.username = "gennadi";
    home.homeDirectory = "/home/gennadi";
    home.stateVersion = "23.11"; 

    # Required to get the fonts installed by home-manager to be picked up by OS.
    fonts.fontconfig.enable = true;

    # See https://discourse.nixos.org/t/home-manager-installed-apps-dont-show-up-in-applications-launcher/8523/2.
    targets.genericLinux.enable = true;

    home.packages = with pkgs;  [
         # nerdfonts
         babelfish
         bottom
         coreutils
         delta
         du-dust
         fd
         gcc
         git
         git-lfs
         gnumake
         gnupg
         go
         just
         jq
         lazygit
         neovim
         nodejs_20
         php
         phpPackages.composer
         pv
         ripgrep
         symfony-cli
         wl-clipboard
         mysql80
         qmk
    ];

    home.file."${config.xdg.configHome}" = {
        source = ./config;
        recursive = true;
    };

    home.file.".editorconfig".source = ./editorconfig;

    home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        KEYTIMEOUT = 1;
        SHELL = "/home/gennadi/.nix-profile/bin/fish";
    };

    programs = {
        bash = {
            enable = false;
        };
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
            enableAliases = true;
        };
        fzf = {
            enableFishIntegration = true;
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
        };
        tmux = tmux pkgs;
        fish = fish pkgs;
    };
}
