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

  environment.systemPackages = with pkgs; [
    nemo-with-extensions
    wl-clipboard-rs
    cliphist
    brave
  ];
}
