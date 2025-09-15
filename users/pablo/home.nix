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
    # Development
    gh
    cargo
    watchexec
    rustc
    gcc
    deno
    nodejs
    supabase-cli
    jujutsu
    act
    concurrently
    lefthook
    clippy
    yaak
    mermaid-cli
    umlet

    # Nix
    nix-prefetch-github

    # Browsers
    inputs.zen-browser.packages.${pkgs.system}.default
    # google-chrome
    # firefox

    # Other apps
    youtube-music
    pavucontrol

    # Vulnerable because of qtwebengine-5.15.19
    # stremio
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

  # Default applications
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "zen-browser.desktop";
        "x-scheme-handler/http" = "zen-browser.desktop";
        "x-scheme-handler/https" = "zen-browser.desktop";
      };
    };
  };

  home.sessionVariables = {
    BROWSER = "zen-browser";
  };
}
