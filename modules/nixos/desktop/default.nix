{
  pkgs,
  ...
}:
{
  imports = [
    ./greeter
    ./hyprland
    ./rofi
    ./steam
  ];

  programs.waybar.enable = true;

  environment.systemPackages = with pkgs; [
    nemo-with-extensions
    wl-clipboard-rs
    brave
  ];
}
