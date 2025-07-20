{ pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./console.nix
    ./fonts.nix
    ./locale.nix
    ./graphics.nix
  ];

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  programs.nano.enable = false;

  environment.systemPackages = with pkgs; [
    fastfetch
    git
    neovim
    unzip
    wget
  ];
}
