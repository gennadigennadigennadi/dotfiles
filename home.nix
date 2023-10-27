{ config, lib, pkgs, ... }:

{
    nixpkgs = {
        config = {
            allowUnfree = true;
        };
    };
    home.username = "gennadi";
    home.homeDirectory = "/home/gennadi";
    home.stateVersion = "23.05"; 

    # Required to get the fonts installed by home-manager to be picked up by OS.
    fonts.fontconfig.enable = true;

    # See https://discourse.nixos.org/t/home-manager-installed-apps-dont-show-up-in-applications-launcher/8523/2.
    targets.genericLinux.enable = true;

    home.packages = with pkgs;  [
         # nerdfonts
         # php82
         babelfish
         bat
         bottom
         delta
         du-dust
         eza
         fd
         fzf
         gcc
         git
         gnumake
         go
         jq
         lazygit
         neovim
         nodejs_20
         php82Packages.composer
         pv
         ripgrep
         symfony-cli
         wl-clipboard
         mysql80
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
        home-manager = { 
            enable = true;
        };
        fzf = {
            enableFishIntegration = true;
            enable = true;
        };
        tmux = {
            enable = true;
            shortcut = "a";
            aggressiveResize = true;
            baseIndex = 1;
            newSession = true;
            escapeTime = 0;
            terminal = "xterm-256color";
            mouse = true;
            clock24 = true;
            keyMode = "vi";
            prefix = "c-a";
            historyLimit = 10000;
            # shell = "/home/gennadi/.nix-profile/bin/fish";
            shell = "${pkgs.fish}/bin/fish";

            plugins = with pkgs; [
                tmuxPlugins.better-mouse-mode
                {
                    plugin = tmuxPlugins.catppuccin;
                    extraConfig = ''
                        set -g @catppuccin_left_separator "█"
                        set -g @catppuccin_right_separator "█"
                        set -g @catppuccin_flavour "frappe"
                    '';
                }
                {
                    plugin = tmuxPlugins.continuum;
                    extraConfig = ''
                        set -g @continuum-boot 'on'
                        set -g @continuum-restore 'on'
                        set -g @continuum-save-interval '5' # minutes
                    '';
                }            
                tmuxPlugins.resurrect
                tmuxPlugins.vim-tmux-navigator
                tmuxPlugins.yank
            ];

            extraConfig = ''
                set-option -g status-position top
            '';
        };
        starship = {
            enable = true;
            enableFishIntegration = true;
        };
        fish = {
            enable = true;
            plugins = [
              { name = "z"; src = pkgs.fishPlugins.z.src; }
            ];
            shellAbbrs = {
                vim = "nvim";
                ll = "exa -gla --icons";
                l = "exa -gl --icons";
                ip = "ipconfig getifaddr en1";
                g= "git";
                v= "nvim";
                lg= "lazygit";
                ports= "sudo lsof -i -P -n | grep LISTEN";
                hm = "home-manager switch --flake ~/Code/dotfiles/";
            };
        };
    };
}
