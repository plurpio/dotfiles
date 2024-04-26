{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    act
    go
    cargo
    clang
    nodejs

    python3
    python3Packages.virtualenv
    python3Packages.pip
  ];

  home-manager.users.nico.programs = {
    git.enable = true;
    git.userName = "Plurpio";
    git.userEmail = "148961679+plurpio@users.noreply.github.com";

    gh.enable = true;
    gh.settings.git_protocol = "https";
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
