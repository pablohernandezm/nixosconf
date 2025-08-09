{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../shared
  ];

  home.packages = with pkgs; [
    gh
    cargo
    rustc
    gcc
    deno
    nodejs
    supabase-cli
    jujutsu
    act
    inputs.zen-browser.packages.${pkgs.system}.default
    stremio
  ];

  programs.git = {
    enable = true;
    userEmail = "phernandezm07@gmail.com";
    userName = "pablohernandezm";
    extraConfig = {
      core.editor = "nvim";
    };
    delta = {
      enable = true;
    };
  };
}
