{ config, pkgs, ... }:

{
  # Enable the X server
  services.xserver.enable = true;

  # Enable SDDM (Simple Desktop Display Manager) with Wayland support
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Configure the keyboard layout for X11
  services.xserver.xkb = {
    layout = "de"; # Set layout to German
    variant = ""; # Use the default variant
  };
}
