{ config, pkgs, ... }:

{
  home.username = "kentaro";
  home.homeDirectory = "/home/kentaro";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
  ];

  gtk = {
    enable = true;
    cursorTheme.name = "rose-pine-cursor";
  };

  programs = {
    home-manager.enable = true;

      userName = "Kentaro Wuertele";
      userEmail = "ken@wuertele.com";
    };
  };

  home.sessionVariables = {
    EDITOR = "emacs";
  };

  home.file = {

  };

  home.stateVersion = "25.05"; # Please read the comment before changing.
}
