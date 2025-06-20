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
    cursorTheme.name = "BreezeX-RosePine-Linux";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
      # Variables
      "$terminal" = "kitty";
      "$browser" = "firefox";
      "$menu" = "rofi -show drun -show-icons";
      "$screenshot" = "grim -g \"$(slurp)\"";
      "$mainMod" = "SUPER";

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor = ",preferred,auto,auto";

      # Autostart
      exec-once = [
        "swww-daemon"
	"swww img $HOME/Wallpapers/eclipse.png"
	"nm-applet --indicator"
	"waybar"

	"[workspace 1 silent] emacs"
	"[workspace 2 silent] $browser"
	"[workspace 3 silent] $terminal"
      ];

      # See https://wiki.hyprland.org/Configuring/Environment-variables/
      env = [
	"HYPRCURSOR_THEME,rose-pine-hyprcursor"
	"HYPRCURSOR_SIZE,24"
      ];

      # https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 0.8;
        
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#animations
       animations = {
        enabled = true;
        
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = true;
	preserve_split = true;
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = {
        new_status = "master";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper = -1;
	disable_hyprland_logo = false;
      };

      # https://wiki.hyprland.org/Configuring/Variables/#input
      input = {
        kb_layout = "us";
        kb_variant = "colemak_dh";
        kb_options = "ctrl:swapcaps";
        follow_mouse = 1;
        sensitivity = 0.25;
        
        touchpad = {
          natural_scroll = false;
          scroll_factor = 0.5;
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = {
        workspace_swipe = false;
      };

      # Keybindings
      bind = [
        # Switching keyboard layouts
	"$mainMod_SHIFT, C, exec, hyprctl keyword input:kb_variant colemak_dh"
	"$mainMod_SHIFT, C, exec, hyprctl keyword input:kb_options ctrl:swapcaps"
	"$mainMod_SHIFT, Q, exec, hyprctl keyword input:kb_variant ''"
	"$mainMod_SHIFT, Q, exec, hyprctl keyword input:kb_options ''"
	
	"$mainMod, F, fullscreen"

        # Program shortcuts
        "$mainMod, T, exec, $terminal"
	"$mainMod, RETURN, exec, emacs"
	"$mainMod, L, exec, $browser"
	"$mainMod, C, killactive,"
	"$mainMod, M, exit,"
	"$mainMod, E, exec, $fileManager"
	"$mainMod, V, togglefloating,"
	"$mainMod, SLASH, exec, $menu"
	"$mainMod, S, exec, $screenshot"
	"$mainMod, P, pseudo," # dwindle
	"$mainMod, J, togglesplit," # dwindle

	# Move focus with mainMod + arrow keys
	"$mainMod, left, movefocus, l"
	"$mainMod, right, movefocus, r"
	"$mainMod, up, movefocus, u"
	"$mainMod, down, movefocus, d"

	# Switch workspaces with mainMod + [0-9]
	"$mainMod, 1, workspace, 1"
	"$mainMod, 2, workspace, 2"
	"$mainMod, 3, workspace, 3"
	"$mainMod, 4, workspace, 4"
	"$mainMod, 5, workspace, 5"
	"$mainMod, 6, workspace, 6"
	"$mainMod, 7, workspace, 7"
	"$mainMod, 8, workspace, 8"
	"$mainMod, 9, workspace, 9"
	"$mainMod, 0, workspace, 10"

	# Move active window to a workspace with mainMod + SHIFT + [0-9]
	"$mainMod SHIFT, 1, movetoworkspace, 1"
	"$mainMod SHIFT, 2, movetoworkspace, 2"
	"$mainMod SHIFT, 3, movetoworkspace, 3"
	"$mainMod SHIFT, 4, movetoworkspace, 4"
	"$mainMod SHIFT, 5, movetoworkspace, 5"
	"$mainMod SHIFT, 6, movetoworkspace, 6"
	"$mainMod SHIFT, 7, movetoworkspace, 7"
	"$mainMod SHIFT, 8, movetoworkspace, 8"
	"$mainMod SHIFT, 9, movetoworkspace, 9"
	"$mainMod SHIFT, 0, movetoworkspace, 10"

	# Scroll through existing workspaces with mainMod + scroll
	"$mainMod, mouse_down, workspace, e+1"
	"$mainMod, mouse_up, workspace, e-1"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
	"$mainMod, mouse:273, resizewindow"
      ];

      # Laptop multimedia keys for volume and LCD brightness
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
	",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
	",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
	",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      # Requires playerctl
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
	", XF86AudioPause, exec, playerctl play-pause"
	", XF86AudioPlay, exec, playerctl play-pause"
	", XF86AudioPrev, exec, playerctl previous"
      ];

      windowrulev2 = [
        # Ignore maximize requests from apps. You'll probably like this.
	"suppressevent maximize, class:.*"
	# Fix some dragging issues with XWayland
	"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };

    systemd.variables = [ "--all" ];
  };

  programs = {
    home-manager.enable = true;
    
    git = {
      enable = true;
      userName = "Kentaro Wuertele";
      userEmail = "ken@wuertele.com";
    };

    waybar.enable = true;
  };

  home.sessionVariables = {
    EDITOR = "emacs";
  };

  home.file = {
    # # Hyprland startup script
    # ".config/hypr/start.sh" = {
    #   executable = true;
      
    #   text = ''
    #     #!/usr/bin/env bash

    #     # Initializing wallpaper daemon
    #     swww init &
    #     # Setting wallpaper
    #     swww img "~/Wallpapers/eclipse.png"

    #     nm-applet --indicator &

    #     waybar &
    #   '';
    # };
  };

  home.stateVersion = "25.05"; # Please read the comment before changing.
}
