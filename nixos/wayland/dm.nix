{ config, pkgs, ... }:

{
  # Enable the X server
  services.xserver.enable = true;

  # Enable GDM (GNOME Display Manager) with Wayland support
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  # Configure the keyboard layout for X11
  services.xserver.xkb = {
    layout = "de"; # Set layout to German
    variant = ""; # Use the default variant
  };
}
