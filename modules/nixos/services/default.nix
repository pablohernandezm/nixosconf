{ ... }:
{
  imports = [
    ./cups
    ./firewall
    ./networking
    ./nh
    ./sound
    ./ssh
    ./tmux
    ./virtualization
    ./fish
    ./neovim
  ];

  # Simple services settings
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  programs.command-not-found.enable = true;
}
