{
  system,
  inputs,
  ...
}:
{
  imports = [
    # inputs.home-manager.nixosModules.home-manager
    (import "${inputs.home-manager}/nixos")
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pablo = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    initialPassword = "password";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.extraSpecialArgs = {
    inherit inputs;
    inherit system;
  };

  home-manager.users = {
    pablo = import ../../users/pablo/home.nix;
  };
}
