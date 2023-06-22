{ config, lib, pkgs, ... }:

let
  # to add channel; nix-channel --add https://github.com/guibou/nixGL/archive/main.tar.gz nixgl
  # to customise packages in config; https://gsc.io/70266391-48a6-49be-ab5d-acb5d7f17e76-nixos/doc/nixos-manual/html/sec-package-management.html#sec-customising-packages

  # the motivation for nixGL; https://discourse.nixos.org/t/design-discussion-about-nixgl-opengl-cuda-opencl-wrapper-for-nix/2453
  # nixgl = import <nixgl> {} ;
  nixGuiWrap = pkg: pkgs.runCommand "${pkg.name}-nixgui-wrapper" {} ''
    mkdir $out
    ln -s ${pkg}/* $out
    rm $out/bin
    mkdir $out/bin
    # nixGL/Home Manager issue; https://github.com/guibou/nixGL/issues/44
    # nixGL/Home Manager issue; https://github.com/guibou/nixGL/issues/114
    # nixGL causes all software ran under it to gain nixGL status; https://github.com/guibou/nixGL/issues/116
    # we wrap packages with nixGL; it customizes LD_LIBRARY_PATH and related
    # envs so that nixpkgs find a compatible OpenGL driver
    nixgl_bin="${lib.getExe pkgs.nixgl.auto.nixGLDefault}"
    # Similar to OpenGL, the executables installed by nix cannot find the GTK modules
    # required by the environment. The workaround is to unset the GTK_MODULES and
    # GTK3_MODULES so that it does not reach for system GTK modules.
    # We also need to modify the GTK_PATH to point to libcanberra-gtk3 installed via Nix
    gtk_path="${lib.getLib pkgs.libcanberra-gtk3}/lib/gtk-3.0"
    for bin in ${pkg}/bin/*; do
      wrapped_bin=$out/bin/$(basename $bin)
      echo "exec env GTK_MODULES= GTK3_MODULES= GTK_PATH=\"$gtk_path\" $nixgl_bin  $bin \"\$@\"" > $wrapped_bin
      chmod +x $wrapped_bin
    done
  '';

in {
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
         bat
         bottom
         delta
         docker
         du-dust
         exa
         fd
         fzf
         gcc
         git
         gnumake
         go
         jq
         lazygit
         neovim
         nerdfonts
         nodejs_20
         php82
         php82Packages.composer
         podman
         podman-compose
         ripgrep
         wl-clipboard
         zsh
         nixgl.auto.nixGLDefault

        # GUI   
        (nixGuiWrap alacritty)
        gnome.nautilus
        gnome.gnome-tweaks
        gnome.gnome-terminal
        gnome.gnome-calendar
        gnome.gedit
        gnome.geary
        cider
        dbeaver
        ungoogled-chromium
        slack
        signal-desktop
        insomnia
        jetbrains.phpstorm
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
                        set -g @catppuccin_flavour "latte"
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
