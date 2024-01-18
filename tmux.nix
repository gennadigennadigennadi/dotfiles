pkgs: {
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
}


