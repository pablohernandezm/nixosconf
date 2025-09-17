{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      rose-pine
      yank
      tmux-fzf
      tmux-sessionx

    ];
    keyMode = "vi";
    historyLimit = 5000;
    clock24 = true;
    extraConfig = ''
      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix
      set -g default-command fish
    '';
  };
}
