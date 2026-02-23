{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      commonModules = [ ./home.nix ];
    in {
      homeConfigurations."steve@workstation" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = commonModules ++ [{
          home.username = "steve";
          home.homeDirectory = "/home/steve";
        }];
      };

      homeConfigurations."steve@macbook" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        modules = commonModules ++ [{
          home.username = "steve";
          home.homeDirectory = "/Users/steve";
        }];
      };
    };
}
