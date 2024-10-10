{ config, pkgs, ... }:

{
  # Import the audio configuration
  imports = [
    ./audio.nix # Audio-related configuration file
  ];
}
