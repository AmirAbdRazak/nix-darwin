{
  enable-normalization-flatten-containers = true;
  enable-normalization-opposite-orientation-for-nested-containers = true;

  on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

  mode.main.binding = {
    "alt-enter" =
      ''exec-and-forget osascript -e '
    tell application "Terminal"
        do script
        activate
    end tell'
    '';

    "ctrl-shift-n" =
      "focus --boundaries-action wrap-around-the-workspace left";
    "ctrl-shift-e" =
      "focus --boundaries-action wrap-around-the-workspace down";
    "ctrl-shift-u" = "focus --boundaries-action wrap-around-the-workspace up";
    "ctrl-shift-a" =
      "focus --boundaries-action wrap-around-the-workspace right";

    "ctrl-shift-alt-n" = "move left";
    "ctrl-shift-alt-e" = "move down";
    "ctrl-shift-alt-u" = "move up";
    "ctrl-shift-alt-a" = "move right";

    "ctrl-shift-alt-h" = "join-with left";
    "ctrl-shift-alt-v" = "join-with down";

    "ctrl-shift-alt-f" = "fullscreen";
    "ctrl-shift-alt-m" = "macos-native-minimize";
    "ctrl-shift-alt-q" = "close";

    "ctrl-shift-alt-s" = "layout v_accordion"; # 'layout stacking' in i3
    "ctrl-shift-alt-w" = "layout h_accordion"; # 'layout tabbed' in i3
    "ctrl-shift-alt-d" =
      "layout tiles horizontal vertical"; # 'layout toggle split' in i3

    "ctrl-shift-alt-space" = "layout floating tiling"; # 'floating toggle' in i3

    # `focus parent`/`focus child` are not yet supported, and it's not clear
    # whether they should be supported at all
    # https://github.com/nikitabobko/AeroSpace/issues/5
    # alt-a = 'focus parent'

    "alt-shift-1" = "workspace 1";
    "alt-shift-2" = "workspace 2";
    "alt-shift-3" = "workspace 3";
    "alt-shift-4" = "workspace 4";
    "alt-shift-5" = "workspace 5";
    "alt-shift-6" = "workspace 6";
    "alt-shift-7" = "workspace 7";
    "alt-shift-8" = "workspace 8";
    "alt-shift-9" = "workspace 9";
    "alt-shift-0" = "workspace 10";

    "ctrl-shift-alt-1" = "move-node-to-workspace 1";
    "ctrl-shift-alt-2" = "move-node-to-workspace 2";
    "ctrl-shift-alt-3" = "move-node-to-workspace 3";
    "ctrl-shift-alt-4" = "move-node-to-workspace 4";
    "ctrl-shift-alt-5" = "move-node-to-workspace 5";
    "ctrl-shift-alt-6" = "move-node-to-workspace 6";
    "ctrl-shift-alt-7" = "move-node-to-workspace 7";
    "ctrl-shift-alt-8" = "move-node-to-workspace 8";
    "ctrl-shift-alt-9" = "move-node-to-workspace 9";
    "ctrl-shift-alt-0" = "move-node-to-workspace 10";

    "ctrl-shift-alt-c" = "reload-config";

    "ctrl-shift-alt-r" = "mode resize";
  };

  mode.resize.binding = {
    n = "resize width -50";
    u = "resize height +50";
    e = "resize height -50";
    i = "resize width +50";
    enter = "mode main";
    esc = "mode main";
  };
}
