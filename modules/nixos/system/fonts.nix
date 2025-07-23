{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      roboto-slab
      domine
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Domine" ];
        sansSerif = [ "Roboto" ];
        monospace = [ "JetBrainsMono NFM" ];
      };
    };
  };
}
