{
  description = "Plurpio's NixOS configuration flake.";

  #
  # configurating cachix ( to download instead of build pkgs )
  #

  nixConfig = {
    substituters = [
      "https://hyprland.cachix.org"
      "https://cache.nixos.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };


  #
  # configuring inputs
  #

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.3.0";
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-flatpak, home-manager, ... }@inputs: {
    system = "x86_64-linux";

  #
  # penguin ( main desktop sys )
  #

    nixosConfigurations.penguin = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager
        ./configuration.nix
        ./core/shell.nix
        ./core/users.nix

        ./desktop/apps.nix
        ./desktop/desktop.nix
        ./desktop/development.nix
        ./desktop/media.nix
        ./desktop/pwa.nix
      ];
    };

  #
  # eudyptula ( minimal )
  #

    nixosConfigurations.eudyptula = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager
        ./configuration.nix
        ./core/shell.nix
        ./core/users.nix

        ./desktop/desktop.nix
      ];
    };
  };
}
