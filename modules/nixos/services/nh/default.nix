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
    nhboot = "nh os boot . -H ${host}";
    nhbuild = "nh os build . -H ${host}";
    nhswitch = "nh os switch . -H ${host}";
    nhtest = "nh os test . -H ${host}";
    nhvm = "nh os build-vm . -H ${host}";
  };
}
