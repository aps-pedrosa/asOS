{

  description = "Aether System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, hyprpanel, home-manager, ... }:
  let
    system = "x86_64-linux";
  in {
  nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [ ./configuration.nix ];
  };

  homeConfigurations.aether = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        inputs.hyprpanel.overlay
      ];
    };
    extraSpecialArgs = {
      inherit system;
      inherit inputs;
    };
    modules = [ ./home.nix ];
  };
  };
}
