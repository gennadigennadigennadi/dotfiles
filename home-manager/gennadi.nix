{ config, pkgs, ... }:

{
     nixpkgs = {
        config = {
            allowUnfree = true;
            allowUnfreePredicate = (_: true);
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
        fish
        git
        go
        jq
        lazygit
        php
        ripgrep
        tmux
        zsh
    ];

    home.file."${config.xdg.configHome}" = {
        source = ../config;
        recursive = true;
    };

    home.file.".editorconfig".source = ../.editorconfig;
    home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        KEYTIMEOUT = 1;
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
            enable =true;
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
