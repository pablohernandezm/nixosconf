{ pkgs, ... }:
let
  theme = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "kitty";
    rev = "788bf1bf1a688dff9bbacbd9e516d83ac7dbd216";
    hash = "sha256-AcMVkliLGuabZVGkfQPLhfspkaTZxPG5GyuJdzA4uSg=";
  };
in
{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      allow_remote_control yes
      listen_on unix:/tmp/mykitty

      background_opacity 1
      draw_minimal_borders no
      window_border_width 0.5
      window_margin_width 2
      window_padding_width 14

      map ctrl+shift+\ move_window_to_top
      map ctrl+shift+/ new_window_with_cwd !neighbor

      include themes/rose-pine-moon.conf
    '';
  };

  home.file.".config/kitty/themes/" = {
    source = "${theme}/dist";
    recursive = true;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/x-terminal-emulator" = [ "kitty.desktop" ];
      "x-scheme-handler/terminal" = [ "kitty.desktop" ]; # Important for any application that uses this
    };
  };

  xdg.desktopEntries.kitty = {
    name = "Kitty";
    genericName = "Terminal Emulator";
    exec = "kitty";
    icon = "kitty";
    terminal = false;
    categories = [
      "System"
      "TerminalEmulator"
    ]; # Critical for this to be recognized as a terminal
  };
}
