{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    steam-run-free
    wine-wayland
  ];

  programs = {
    steam = {
      enable = true;
      # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      # localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };

    # Some games may distribute on Linux as an AppImage.
    # To get them to execute via Steam, enable AppImage with the binfmt setting
    appimage = {
      enable = true;
      binfmt = true;
    };
  };
}
