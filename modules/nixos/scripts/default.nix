{ pkgs, ... }:
let
  paths = [
    ./pindex.nix
    ./nvimctl.nix
  ];
  mkImport = path: import path { inherit pkgs; };
in
{
  environment.systemPackages = builtins.map mkImport paths;
}
