{ pkgs, ... }:
pkgs.writeShellApplication {
  name = "pindex";
  text = ''
    exec nix run github:nix-community/nix-index-database -- "$@"
  '';
}
