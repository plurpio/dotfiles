{
  description = "Plurpio's NixOS configuration flake.";

  #
  # configuring inputs
  #

  nixConfig = {
    substituters = [
      "https://cosmic.cachix.org/"
      "https://cache.nixos.org"
    ];

    trusted-public-keys = [
      "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.3.0";

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nix-flatpak, nixos-cosmic, ... }@inputs: {
    system = "x86_64-linux";

    nixosConfigurations.penguin = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        nixos-cosmic.nixosModules.default
        ./configuration.nix
      ];
    };
  };
}
