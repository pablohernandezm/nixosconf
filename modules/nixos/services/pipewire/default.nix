{ ... }:
{
  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Whether to enable the RealtimeKit system service,
  # which hands out realtime scheduling priority to user processes on demand.
  # For example, PulseAudio and PipeWire use this to acquire realtime priority.
  security.rtkit.enable = true;
}
