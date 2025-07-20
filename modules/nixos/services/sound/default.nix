{ ... }:
{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.playerctld.enable = true;

  # Whether to enable the RealtimeKit system service,
  # which hands out realtime scheduling priority to user processes on demand.
  # For example, PulseAudio and PipeWire use this to acquire realtime priority.
  security.rtkit.enable = true;
}
