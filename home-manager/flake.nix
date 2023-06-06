{
    description = "Home Manager configuration of gennadi";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";

        home-manager = {
            url = "github:nix-community/home-manager";
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

            modules = [ ./gennadi.nix ];
        };
    };
}
