{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./boot.nix
    ./console.nix
    ./fonts.nix
    ./locale.nix
    ./graphics.nix
    inputs.nixCats.nixosModules.default
  ];

  nvim = {
    enable = true;
  };

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
    unzip
    wget
  ];
}
