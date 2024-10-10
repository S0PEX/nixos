{ pkgs, inputs, ... }:

{
  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Enable Fish shell as the default shell
  programs.fish.enable = true;

  # Configure user-specific settings
  users.users.s0pex = {
    isNormalUser = true; # Specify that this is a normal user
    description = "Artur"; # User description
    shell = pkgs.fish; # Set Fish as the user's shell
    extraGroups = [
      # Additional groups for the user
      "networkmanager"
      "wheel" # Allows the user to use sudo
    ];
    # Specify additional packages for the user
    packages = with pkgs; [
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
  };
}
