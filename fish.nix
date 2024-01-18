pkgs: 
{
    enable = true;
    # plugins = [
    #     { name = "z"; src = pkgs.fishPlugins.z.src; }
    # ];
    shellAbbrs = {
        vv = "/usr/bin/nvim";
        vim = "nvim";
        # ll = "exa -gla --icons";
        # l = "exa -gl --icons";
        ip = "ipconfig getifaddr en1";
        g= "git";
        v= "nvim";
        lg= "lazygit";
        ports= "sudo lsof -i -P -n | grep LISTEN";
        hm = "home-manager switch --flake ~/Code/dotfiles/";
    };
    interactiveShellInit = ''
        set -g fish_greeting
        '';
}
