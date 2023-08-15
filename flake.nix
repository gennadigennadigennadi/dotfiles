{
    description = "Home Manager configuration of gennadi";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... }:
    let
        system = "x86_64-linux";
        pkgsForSystem = system: import nixpkgs {
            inherit system;
      };
       pkgs = pkgsForSystem system;
    in {
        homeConfigurations."gennadi" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            modules = [ ./home.nix ];
        };
    };
}
