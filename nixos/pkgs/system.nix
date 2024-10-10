{ config, pkgs, lib, ... }:

{
  # System packages for Fish shell and related plugins
  environment.systemPackages = with pkgs; [
    firefox-bin # Firefox web browser
    git # Distributed version control system
    fishPlugins.done # Completion plugin for Fish
    fishPlugins.fzf-fish # Fuzzy finder integration for Fish
    fishPlugins.forgit # Plugin for managing forgotten commands
    fishPlugins.hydro # Hydration prompts for Fish
    fzf # Command-line fuzzy finder
    fishPlugins.grc # Colorized output for commands
    grc # Generalized colorizer
  ];

  # System fonts for various applications
  fonts.packages = with pkgs; [
  ];

  # Enable Fish shell
  programs.fish.enable = true;
}
