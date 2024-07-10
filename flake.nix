{
  description = "_Zaizen_ NixOS configuration";

  inputs = {
    
        musnix  = { url = "github:musnix/musnix"; };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
  
  let 
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
    
      
      config = {
        allowUnfree = true;
      };
    };
    in
  {
      nixosConfigurations = {
        anulo2Nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit system; };

          modules = [
   
            ./nixos/configuration.nix
          ];
        };
      };
  };
}
