{ pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./console.nix
    ./fonts.nix
    ./locale.nix
    ./graphics.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.auto-optimise-store = true;
  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;
    dates = [
      "20:00"
      "12:00"
    ];
    options = "--delete-older-than 3d";
  };

  programs.nano.enable = false;

  environment.systemPackages = with pkgs; [
    fastfetch
    git
    neovim
    unzip
    wget
  ];
}
