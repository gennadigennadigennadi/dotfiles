{ config, pkgs, ... }:

{
  home.username = "gennadi";
  home.homeDirectory = "/home/gennadi/";
  home.stateVersion = "23.05"; 

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
    tmux
  ];

  home.file."${config.xdg.configHome}" = {
    source = ../config;
    recursive = true;
  };
  programs.home-manager.enable = true;
}
