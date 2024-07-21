{
  description = "Plurpio's NixOS configuration flake.";

  #
  # configuring inputs
  #

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.3.0";
  };

  outputs = { self, nixpkgs, nix-flatpak, ... }@inputs: {
    system = "x86_64-linux";

    nixosConfigurations.penguin = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        ./configuration.nix
      ];
    };
  };
}
