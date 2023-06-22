{
    description = "Home Manager configuration of gennadi";

    inputs = {
        # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        # nixgl is needed for alacritty outside of nixOS
        # refer to https://github.com/NixOS/nixpkgs/issues/122671
        # https://github.com/guibou/nixGL/#use-an-overlay
        nixgl.url = "github:guibou/nixGL";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, nixgl, ... }:
    let
        system = "x86_64-linux";
        pkgsForSystem = system: import nixpkgs {
            inherit system;
            config = { allowUnfree = true; };
            overlays = [ nixgl.overlay ];
      };
       pkgs = pkgsForSystem system;
    in {
        homeConfigurations."gennadi" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            modules = [ ./home.nix ];
        };
    };
}
