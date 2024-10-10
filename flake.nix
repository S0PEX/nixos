{
  description = "NixOS systems and tools by S0PEX";

  inputs = {
    # Define the primary nixpkgs repository for stable configurations
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";

    # Define the nixpkgs-unstable repository for testing or using more recent packages
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Define home-manager for managing user configurations
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs:
    let
      mkSystem = import ./lib/mkSystem.nix {
        inherit nixpkgs inputs;
      };
    in
    {
      # Define NixOS configurations
      nixosConfigurations.nixos = mkSystem "vm" {
        user = "s0pex"; # Specify the user for the configuration
      };
    };
}
