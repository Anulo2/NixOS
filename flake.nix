{
  description = "_Zaizen_ NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        musnix  = { url = "github:musnix/musnix"; };

   
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      
    };
  };

  outputs = { self, nixpkgs, home-manager,  musnix, ... }:
  let 
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      inherit inputs;
      
      config = {
        allowUnfree = true;
      };
    };
    in
  {
      nixosConfigurations = {
        anulo2Nixos = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            musnix.nixosModules.musnix
            ./nixos/configuration.nix
          ];
        };
      };
  };
}
