{ pkgs, ... }:
{
  home.packages = with pkgs; [
    itch
    heroic
    lutris
    # prismlauncher #Build error
  ];

  xdg.desktopEntries.steam-run = {
    name = "Steam Run";
    exec = "${pkgs.steam-run}/bin/steam-run";
    type = "Application";
    icon = "steam";
    mimeType = [
      "application/x-shellscript"
    ];
  };
}
