{ config, pkgs, ... }:

{
  home.username = "kentaro";
  home.homeDirectory = "/home/kentaro";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
  ];

  services.udiskie = {
    enable = true;
    settings = {
      # workaround for
      # https://github.com/nix-community/home-manager/issues/632
      program_options = {
        # replace with your favorite file manager
        file_manager = "${pkgs.nemo-with-extensions}/bin/nemo";
      };    
    };
  };
  
  gtk = {
    enable = true;
    cursorTheme.name = "BreezeX-RosePine-Linux";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd.variables = [ "--all" ];
  };
  xdg.configFile."hypr/hyprland.lua".source = ./hypr/hyprland.lua;

  programs = {
    home-manager.enable = true;
    bash.enable = true;
    
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      settings = {
        user = {
          name = "Kentaro Wuertele";
          email = "ken@wuertele.com";
	};
	init.defaultBranch = "main";
      };
    };

    waybar.enable = true;

    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };
  };

  home.sessionVariables = {
    EDITOR = "emacs";
  };

  home.stateVersion = "25.05"; # Please read the comment before changing.
}
