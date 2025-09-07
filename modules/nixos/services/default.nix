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
  ];

  # Simple services settings
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.command-not-found.enable = true;
}
