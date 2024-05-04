{ inputs, config, lib, pkgs, ... }:

let
    php = pkgs.php83.buildEnv { extraConfig = "memory_limit = 4G"; };
    php81 = pkgs.php81.buildEnv { extraConfig = "memory_limit = 4G"; };
    fish = import ./fish.nix;
    tmux = import ./tmux.nix;
in {
    nixpkgs = {
        config.allowUnfree = true;
        overlays = [
            inputs.neovim-nightly-overlay.overlay
        ];
    };

    home.username = "gennadi";
    home.homeDirectory = "/home/gennadi";
    home.stateVersion = "23.11"; 

    # Required to get the fonts installed by home-manager to be picked up by OS.
    fonts.fontconfig.enable = true;

    # See https://discourse.nixos.org/t/home-manager-installed-apps-dont-show-up-in-applications-launcher/8523/2.
    targets.genericLinux.enable = true;

    home.packages = with pkgs;  [
         # nerdfonts
         (nerdfonts.override { fonts = [ "JetBrainsMono" "VictorMono"  ]; })
         monaspace
         babelfish
         bottom
         coreutils
         delta
         dfu-programmer
         du-dust
         fd
         gcc
         git
         # git-lfs
         gnumake
         gnupg
         go
         just
         jq
         lazygit
         neovim
         neovim-nightly
         nodejs_20
         php
         phpPackages.composer
         # php81Packages.composer
         # php81
         pv
         ripgrep
         symfony-cli
         wl-clipboard
         openssl
         mysql80
         # qmk
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
        # SHELL = "/home/gennadi/.nix-profile/bin/fish";
    };

    programs = {
        # bash = {
        #     enable = false;
        # };
        zsh = {
            enable = true;
            enableCompletion = true;
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;
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
            enableFishIntegration = true;
            enableZshIntegration = true;
        };
        fzf = {
            enable = true;
            enableFishIntegration = true;
            enableZshIntegration = true;
        };
        starship = {
            enable = true;
            enableFishIntegration = true;
            enableZshIntegration = true;
            settings = {
                add_newline = true;
            };
        };
        zoxide = {
            enable = true;
            enableFishIntegration = true;
            enableZshIntegration = true;
            options = [ "--cmd cd" ];
        };
        tmux = tmux pkgs;
        fish = fish pkgs;

    };

    dconf.settings = {
        "org/gnome/desktop/peripherals/mouse" = { natural-scroll = true; };    
        "org/gnome/desktop/interface" = { show-battery-percentage = true; };
        "org/gnome/desktop/input-sources" = { 
            xkb-options = ["compose:ralt" "caps:escape"];
        };
        "org/gnome/mutter" = {
              # Enable window snapping to the edges of the screen
              # edge-tiling = true;
              # Enable fractional scaling
              # experimental-features = [ "scale-monitor-framebuffer" ];
              # dynamic-workspaces = cfg.desktop.gnome.workspaces.dynamicWorkspaces;
        };
        "org/gnome/shell" = {
            favorite-apps = [
                "org.gnome.Nautilus.desktop"
                "org.gnome.Calendar.desktop"
                "google-chrome.desktop"
                "org.gnome.Epiphany.desktop"
                "phpstorm.desktop"
                "org.gnome.Console.desktop"
                "org.wezfurlong.wezterm.desktop"
                "teams-for-linux.desktop"
                "slack.desktop"
                "spotify.desktop"
            ];
        };
   };
}
