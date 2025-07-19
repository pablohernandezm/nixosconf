{ pkgs, ... }:
{
  services.greenclip.enable = true;

  environment.systemPackages = with pkgs; [
    rofi-power-menu
    rofimoji
    rofi-wayland
  ];
}
