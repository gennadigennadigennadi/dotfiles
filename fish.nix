pkgs: 
{
    enable = true;
    shellAbbrs = {
        vim = "nvim";
        ll = "eza -gla --group-directories-first";
        l = "eza -gl";
        ip = "ipconfig getifaddr en1";
        g= "git";
        vv= "nvim";
        v= "/usr/bin/nvim";
        lg= "lazygit";
        m= "make";
        d= "docker";
        dc= "docker compose";
        tree= "eza --tree --group-directories-first";
        ports= "sudo lsof -i -P -n | grep LISTEN";
        hm = "home-manager switch --flake ~/.dotfiles/";
    };
    interactiveShellInit = ''
        set -g fish_greeting
        set -Ux MANPAGER "nvim +Man!"
        # set -Ux MANWIDTH 999
        '';
}
