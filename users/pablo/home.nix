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
    concurrently
    stremio

    # Browsers
    inputs.zen-browser.packages.${pkgs.system}.default
    google-chrome
    firefox
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
