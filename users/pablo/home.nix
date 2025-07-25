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
    inputs.zen-browser.packages.${pkgs.system}.default
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
