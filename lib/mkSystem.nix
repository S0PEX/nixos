# This function creates a NixOS system based on a setup for a particular architecture.
{ nixpkgs, inputs }:

name:
{ system ? "x86_64-linux"
, user
}:

let
  # The config files for this system.
  hardwareConfig = ../hardware/${name}.nix;
  userConfig = ../users/${user}/nixos.nix;
  userHMConfig = ../users/${user}/home-manager.nix;

  home-manager = inputs.home-manager.nixosModules.home-manager;
in
nixpkgs.lib.nixosSystem {
  inherit system;

  modules = [
    # Allow unfree packages.
    { nixpkgs.config.allowUnfree = true; }

    # Load the main system configuration
    hardwareConfig # Hardware-specific configuration
    userConfig # User-specific configuration
    ../nixos/configuration.nix # Main system configuration

    # Enable home-manager for managing user configurations
    home-manager
    {
      home-manager.backupFileExtension = "hm-backup";
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = import userHMConfig {
        inputs = inputs;
      };
    }
  ];

  specialArgs = inputs; # Pass all flake inputs (e.g., nixpkgs, nixpkgs-unstable)
}
