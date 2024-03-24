{ config, pkgs, ... }:

{
  config = {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.nico = {
      isNormalUser = true;
      description = "nico";
      extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" "flatpak" "disk" "qemu" "kvm" "sshd" "networkmanager" "audio" "video" "root"];
      packages = with pkgs; [];
    };
    };
}
