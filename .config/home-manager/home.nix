{ config, pkgs, ... }:

{
  home.username = "gennadi";
  home.homeDirectory = "/home/gennadi/";
  xdg.cacheHome = "/home/gennadi/.cache/";
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

  programs.home-manager.enable = true;
}
