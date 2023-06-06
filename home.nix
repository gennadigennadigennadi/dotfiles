{ config, pkgs, ... }:

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
        babelfish
        bat
        bottom
        delta
        docker
        exa
        fd
        fzf
        git
        go
        jq
        lazygit
        php
        ripgrep
        zsh
        nerdfonts
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
            enable = true;
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
            # aggressiveResize = true; -- Disabled to be iTerm-friendly
            baseIndex = 1;
            # newSession = true;
            # Stop tmux+escape craziness.
            escapeTime = 0;
            # Force tmux to use /tmp for sockets (WSL2 compat)
            # secureSocket = false;

            plugins = with pkgs; [
                tmuxPlugins.better-mouse-mode
                tmuxPlugins.catppuccin
                tmuxPlugins.continuum
                tmuxPlugins.resurrect
                tmuxPlugins.sensible
                tmuxPlugins.vim-tmux-navigator
                tmuxPlugins.yank
            ];


            extraConfig = ''
                # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
                set -g default-terminal "xterm-256color"
                set -ga terminal-overrides ",*256col*:Tc"
                set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
                set-environment -g COLORTERM "truecolor"

                # Mouse works as expected
                set-option -g mouse on

                set -g @catppuccin_left_separator "█"
                set -g @catppuccin_right_separator "█"

                # or frappe, macchiato, mocha
                set -g @catppuccin_flavour "latte"

                set -g @continuum-boot 'on'
                set -g @continuum-restore 'on'

                set-option -g status-position top
                set-option -g prefix C-a

                # remap prefix from 'C-b' to 'C-a'
                unbind C-b
                bind-key C-a send-prefix

                set -g renumber-windows on

                # set vi-mode
                set-window-option -g mode-keys vi

                # keybindings
                bind-key -T copy-mode-vi v send-keys -X begin-selection
                bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
                bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

                bind '"' split-window -v -c "#{pane_current_path}"
                bind % split-window -h -c "#{pane_current_path}"

                # reload config file (change file location to your the tmux.conf you want to use)
                bind-key R source-file $XDG_CONFIG_HOME/tmux/tmux.conf \; display-message "config reloaded."

                # easy-to-remember split pane commands
                bind | split-window -h -c "#{pane_current_path}"
                bind - split-window -v -c "#{pane_current_path}"
                bind c new-window -c "#{pane_current_path}"
                '';
        };
        fish = {
            enable = true;
            shellAbbrs = {
                vim = "nvim";
                ll = "exa -gla --icons";
                l = "exa -gl --icons";
                ip = "ipconfig getifaddr en1";
                g= "git";
                v= "nvim";
                lg= "lazygit";
                ports= "sudo lsof -i -P -n | grep LISTEN";
            };
        };
    };
}
