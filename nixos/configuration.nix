{ config, pkgs, lib, inputs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Enable onedrive
  services.onedrive.enable = true;

  # Enable printing
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.gutenprint pkgs.gutenprintBin pkgs.cnijfilter2]; # Enable virtualisation
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd.qemu.ovmf.packages = [ pkgs.OVMFFull.fd ];
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  virtualisation.vmware.host.enable = true; # virt-manager doesnt work rn

  virtualisation.waydroid.enable = true;
  virtualisation.docker.enable = true;

  # Miscellaneous
  documentation.man.enable = true;

  #
  # System Settings
  # 

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "penguin";
  networking.networkmanager.enable = true;

  # Drives
  services.udisks2.enable = true;

  # Power settings
  services.upower.enable = true;
  services.tlp.enable = true;

  # OpenGL Settings
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [ intel-media-driver ];

  # SSH
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.AllowUsers = [ "nico" ];
  users.users.nico.openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNBlGMXuW0wcZLOtbidBH+Q/XNShld6QEIs2g72jBKxsbopfVP+VSBLAEaIQvExk+osVQSqcRyK0HXY+JOIJcWn04Bb1DwXhP6aYbmY79rwA1uDMCNFwwDdOvF6pqbXwYIRxKE1xPgVi9aLfS+QM14yHVspf5GzqO+Rgn2ePL5XV23w/ljumQ5U13ucg73uhAtkBDJk1+lE8Yj6kRlVQf+gLOaEl+4fY8/9nxd6HefEJaAg88vu4QT9kDL55u2erZo7lMS3mqvVaONG97gogoQJw+n1AnG4PkwaAMcvEKzdp6tUfKgfqXyeXDFxAWkZBBS3X8QphhjyYj+uyQbF50b" ];

  # Automatic Garbage Collection
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 3d";

  nix.optimise = {
    automatic = true;
    dates = [ "Mon,Fri 20:00" ];
  };

  # Automatic Updates
  system.autoUpgrade = {
      enable = true;
      flags = [ "--update-input" "nixpkgs" ];
      dates = "02:00";
      randomizedDelaySec = "45min";
      persistent = true;
    };

  # Kernel options
  boot.kernel.sysctl = { "vm.swappiness" = 10;};
  boot.kernel.sysctl."kernel.sysrq" = 1;

  # Replace sudo with doas
  security.doas.enable = true;
  security.doas.extraConfig = "permit keepenv persist :wheel";
  security.sudo.enable = false;

  # Enable nix-command and flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
