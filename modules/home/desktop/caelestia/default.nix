{ inputs, ... }:
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  programs.caelestia = {
    enable = true;
    cli = {
      enable = true;
    };
    extraConfig = builtins.readFile ./extraConfig.json;
  };
}
