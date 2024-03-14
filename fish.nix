pkgs: 
{
    enable = true;
    shellAbbrs = {
        vim = "nvim";
        ll = "eza -gla --icons";
        l = "eza -gl --icons";
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
        hm = "home-manager switch --flake ~/Code/dotfiles/";
    };
    interactiveShellInit = ''
        set -g fish_greeting
        '';
}
