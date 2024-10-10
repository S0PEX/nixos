{ inputs, ... }:

{ config, pkgs, ... }:

{
  # Home-manager 22.11 requires this be set. We never set it so we have
  # to use the old state version.
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    # Dotfiles
    chezmoi # Dotfile manager

    # Communications
    discord # Discord chat client

    # IDEs
    vscode # Visual Studio Code
    #jetbrains.goland         # GoLand IDE
    #jetbrains.idea-ultimate  # IntelliJ IDEA
    #jetbrains.pycharm-professional        # PyCharm
    #jetbrains.datagrip       # DataGrip

    # Formatter for Nix
    nixpkgs-fmt
  ];
}
