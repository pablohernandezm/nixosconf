{ pkgs, inputs, ... }:
{
  imports = [
    ../shared
    inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.beta
    # or inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser.enable = true;

  home.packages = with pkgs; [
    gh
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
