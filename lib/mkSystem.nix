# This function creates a NixOS system based on a setup for a particular architecture.
{ nixpkgs, inputs }:

name:
{ system ? "x86_64-linux"
, user
}:

nixpkgs.lib.nixosSystem {
  inherit system;

  modules = [
    # Allow unfree packages.
    { nixpkgs.config.allowUnfree = true; }

    # Load the main system configuration
    ../hardware/${name}.nix    # Hardware-specific configuration
    ../nixos/configuration.nix # Main system configuration

    # Load User configuration
    ../users/${user}/nixos.nix # User-specific configuration
  ];

  specialArgs = inputs; # Pass all flake inputs (e.g., nixpkgs, nixpkgs-unstable)
}
