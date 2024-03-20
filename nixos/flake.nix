{
  description = "Plurpio's NixOS configuration flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.3.0";
  };

  outputs = { self, nixpkgs, nix-flatpak, unstable, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        ./configuration.nix
        ./pkgs.nix
        ./users.nix
        ./ssh.nix
        ./services.nix
        ./locale.nix
        ./system.nix
      ];
    };
  };
}
