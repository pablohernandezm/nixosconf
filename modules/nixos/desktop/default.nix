{
  pkgs,
  ...
}:
{
  imports = [
    ./greeter
    ./hyprland
    ./steam
  ];

  environment.systemPackages = with pkgs; [
    nemo-with-extensions
    wl-clipboard-rs
    cliphist
    brave
    rofi
  ];
}
