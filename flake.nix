{
    description = "Home Manager configuration of gennadi";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

        home-manager = {
            url = "github:nix-community/home-manager/release-23.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... }:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        homeConfigurations."gennadi" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            modules = [ ./home.nix ];
        };
    };
}
