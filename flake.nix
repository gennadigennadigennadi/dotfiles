{
  description = "Nixos config flake";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
    };
    # hyprland = {
    #   url = "github:hyprwm/Hyprland?ref=v0.40.0";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... } @inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      # pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      pkgs-unstable = import nixpkgs-unstable {inherit system; config.allowUnfree = true; };
      username = "gennadi";
    in
  {
    nixosConfigurations.thinkpad = lib.nixosSystem {
      system = system;
      specialArgs = {
        inherit inputs;
        inherit username;
        inherit pkgs-unstable;
        inherit nixpkgs-unstable;
      };
      modules = [
        ./hosts/thinkpad/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit inputs;
              inherit username;
              inherit pkgs-unstable;
              inherit nixpkgs-unstable;
            };
            users.${username} = import ./home;
          };
        }
      ];
    };
  };
}
