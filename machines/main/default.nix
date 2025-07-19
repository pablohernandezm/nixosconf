{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ../../modules/nixos
  ];
  networking.hostName = "main";

  system.stateVersion = "25.11"; # Do not change
}
