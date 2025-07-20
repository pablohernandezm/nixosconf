{ pkgs, ... }:
let
  rose-pine = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "hyprland";
    rev = "6898fe967c59f9bec614a9a58993e0cb8090d052";
    hash = "sha256-obIYZ0ctDrqf8g9DMAQlkfklelpfVYTrnhG9W33OPdE=";
  };
in
{
  imports = [
    ./hypridle.nix
    ./hyprpaper.nix
  ];

  home.file = {
    ".config/hypr/themes/hyprland/rose-pine" = {
      source = rose-pine;
      recursive = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
    portalPackage = null;

    settings = {
      "source" = "${rose-pine}/rose-pine-moon.conf";
      "$mod" = "SUPER";
      "$menu" = ''rofi -show drun -show-icons -run-command "uwsm app -- {cmd}"'';
      "$terminal" = "uwsm app -- kitty";
      "$browser" = "uwsm app -- zen";
      "$emoji" = "rofi -modi emoji -show emoji";

      exec-once = [
        "systemctl --user enable --now hyprpolkitagent.service"
        "uwsm app -- dunst &"
        "systemctl --user enable --now hyprpaper.service"
        "systemctl --user enable --now waybar.service"
      ];

      input = {
        kb_layout = "us";
        kb_variant = "altgr-intl";
      };

      general = {
        border_size = 1;
        "col.active_border" = "$subtle";
        "col.inactive_border" = "$surface";
        resize_on_border = true;

        no_focus_fallback = true;

        # Screen tearing is used to reduce latency and/or jitter in games.
        allow_tearing = true;

        snap = {
          enabled = true;
        };
      };

      decoration = {
        rounding = 10;

        dim_inactive = true;
        dim_strength = 0.06;

        blur = {
          xray = true;
          size = 14;
          passes = 3;
          popups = true;
          popups_ignorealpha = 0.6;
          input_methods = true;
          input_methods_ignorealpha = 0.8;
        };
      };

      bind =
        [
          "$mod, w, exec, pkill waybar || waybar &"
          "$mod, z, exec, $browser"
          "$mod, m, exec, $menu"
          "$mod, e, exec, $emoji"
          "$mod, t, exec, $terminal"
          "$mod, c, killactive,"
          "$mod, s, exec, uwsm app -- hyprshot -m region --freeze"
          "$mod Shift, s, exec, uwsm app -- hyprshot -m output"
          "$mod Alt, s, exec, uwsm app -- hyprshot -m window"

          "$mod, j, movefocus, d"
          "$mod, k, movefocus, u"
          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"

          "$mod Shift, h, movewindow, l"
          "$mod Shift, j, movewindow, d"
          "$mod Shift, k, movewindow, u"
          "$mod Shift, l, movewindow, r"

          "$mod Alt, h, resizeactive, -25 0"
          "$mod Alt, j, resizeactive, 0 25"
          "$mod Alt, k, resizeactive, 0 -25"
          "$mod Alt, l, resizeactive, 25 0"

          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"

          "$mod Shift, [, exec, hyprctl keyword general:layout 'dwindle'"
          "$mod shift, ], exec, hyprctl keyword general:layout 'master'"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (
            builtins.genList (
              x:
              let
                ws =
                  let
                    c = (x + 1) / 10;
                  in
                  builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            ) 10
          )
        );

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      # l -> do stuff even when locked
      # e -> repeats when key is held
      bindle = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      workspace = [
        # No gaps when only
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*" # Ignore maximize requests from apps.
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0" # Fix some dragging issues with XWayland

        # Smart gaps
        "bordersize 0, floating:0, onworkspace:w[tv1]"
        "rounding 0, floating:0, onworkspace:w[tv1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"

        # Tearing
        "immediate, class:^steam_app.*$"
        "immediate, class:^(?i).*minecraft$"
      ];
    };
  };
}
