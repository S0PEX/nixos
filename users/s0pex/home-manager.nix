{ inputs, systemVersion, ... }:

{ config, pkgs, pkgs-unstable, ... }:

{
  # Home-manager 22.11 requires this be set. We never set it so we have
  # to use the old state version.
  home.stateVersion = systemVersion;

  # Stable user packages
  home.packages = with pkgs-unstable; [
    # Browsers
    brave

    # Terminal additions
    oh-my-fish

    # Dotfiles
    chezmoi # Dotfile manager

    # Communications
    discord
    ferdium # Multi service chat client
    thunderbird-bin

    # Multimedia
    youtube-music

    # Writing tools and editors
    vscode
    code-cursor
    texliveFull

    # Programming languages and development tools
    jetbrains.goland
    citrix_workspace

    go # Go programming language
    nodejs_20
    pnpm
    deno # Alternative JavaScript runtime
    nixpkgs-fmt # Formatter for Nix

    # Git clients
    gitkraken

    # Themes
    yaru-theme
  ];

  # Terminal extension
  programs.fish.enable = true;
  programs.starship = {
    enable = true;
  };
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  # Default applications
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/xhtml+xml" = "librewolf.desktop";
      "text/html" = "librewolf.desktop";
      "text/xml" = "librewolf.desktop";
      "x-scheme-handler/ftp" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
    };
  };

  # Theme settings
  gtk = {
    enable = true;
    theme = {
      name = "Yaru-prussiangreen-dark";
      package = pkgs-unstable.yaru-theme;
    };

    # Prefer dark theme for both GTK3 and GTK4
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
}
