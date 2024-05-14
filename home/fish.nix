pkgs:
{
    enable = true;
    shellAbbrs = {
        vim = "nvim";
        ll = "eza -gla --group-directories-first";
        l = "eza -gl";
        ip = "ipconfig getifaddr en1";
        g= "git";
        v= "nvim";
        lg= "lazygit";
        m= "make";
        d= "docker";
        dc= "docker compose";
        tree= "eza --tree --group-directories-first";
        ports= "sudo lsof -i -P -n | grep LISTEN";
        hm = "home-manager switch --flake ~/.dotfiles/";
        update = "sudo nixos-rebuild switch --flake ~/Code/dotfiles/";
    };
    interactiveShellInit = ''
        set -g fish_greeting
        set -Ux MANPAGER "nvim +Man!"
        # set -gx XCURSOR_THEME Adwaita
        # set -Ux MANWIDTH 999
        '';
}
