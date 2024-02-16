pkgs: 
{
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

    plugins = with pkgs.tmuxPlugins; [
        better-mouse-mode
        {
            plugin = catppuccin;
            extraConfig= ''
            set -g @catppuccin_flavour 'latte'
            set -g @catppuccin_window_left_separator '█'
            set -g @catppuccin_window_right_separator '█'
            set -g @catppuccin_status_left_separator '█'
            set -g @catppuccin_status_right_separator '█'

            # set -g @catppuccin_window_current_text "#{pane_current_path}"
            set -g @catppuccin_directory_text "#{pane_current_path}"
            '';
        }
        {
            plugin = resurrect;
            extraConfig = ''
            set -g @resurrect-strategy-vim 'session'
            set -g @resurrect-strategy-nvim 'session'
            set -g @resurrect-capture-pane-contents 'on'
            '';
        }
        {
            plugin = continuum;
            extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-boot 'on'
            set -g @continuum-save-interval '10'
            '';
        }
        vim-tmux-navigator
        yank
    ];
    extraConfig = ''
    set -g status-position top
    '';
}


