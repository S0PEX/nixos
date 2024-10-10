{ config, pkgs, ... }:

{
  # Import additional configuration modules
  imports = [
    ./dm.nix # Display Manager configuration
    ./sway.nix # Sway window manager configuration
  ];
}
