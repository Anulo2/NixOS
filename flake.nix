{
  description = "_Zaizen_ NixOS configuration";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
    musnix = { url = "github:musnix/musnix"; };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: rec {
    nixosConfigurations = {
      anulo2Nixos = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          inputs.musnix.nixosModules.musnix
          ./nixos/configuration.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
