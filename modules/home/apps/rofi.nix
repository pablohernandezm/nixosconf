{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      rofi-power-menu
    ];
    theme = "purple";
  };
}
