{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    act
    go
    cargo
    clang
    nodejs
    gnumake
    github-cli

    python3
    python3Packages.virtualenv
    python3Packages.pip
  ];

  home-manager.users.nico.programs.gpg = {
    enable = true;
    mutableKeys = true;
    settings = {
      pinentry-mode = "loopback";
    };
  };

  environment.shellAliases = {
    gitlc="git log --branches --not --remotes"; # Shows commits that have not been pushed
    ga="git add";
    gc="git commit";
    gs="git status";
    gph="git push";
    gpl="git pull";
  };

}
