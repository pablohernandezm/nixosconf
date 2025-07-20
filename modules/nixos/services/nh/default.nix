{
  host ? "nixos",
  ...
}:
{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 3d --keep 3";
    };
  };

  environment.shellAliases = {
    nhboot = "nh os boot .?submodules=1 -H ${host}";
    nhbuild = "nh os build .?submodules=1 -H ${host}";
    nhswitch = "nh os switch .?submodules=1 -H ${host}";
    nhtest = "nh os test .?submodules=1 -H ${host}";
    nhvm = "nh os build-vm .?submodules=1 -H ${host}";
  };
}
