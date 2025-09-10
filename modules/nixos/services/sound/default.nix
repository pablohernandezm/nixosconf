{ pkgs, ... }:
{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # Uncomment if Bluetooth is being used
    # wireplumber.enable = true;
  };

  environment.systemPackages = with pkgs; [ easyeffects ];

  services.playerctld.enable = true;

  # Whether to enable the RealtimeKit system service,
  # which hands out realtime scheduling priority to user processes on demand.
  # For example, PulseAudio and PipeWire use this to acquire realtime priority.
  security.rtkit.enable = true;
}
