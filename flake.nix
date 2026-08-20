{
  description = "My NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager?ref=master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };
    myAddon = pkgs.callPackage /home/kentaro/nixpkgs/pkgs/by-name/an/anki/addons/jisho-kanji-stroke-order { };
  in
  {

    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
	specialArgs = { inherit inputs system myAddon; };

        modules = [
	  ./nixos/configuration.nix
	];
      };
    };

  };
}
