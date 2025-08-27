{ pkgs, ... }:
let
  themePackage = pkgs.everforest-gtk-theme;
  themeName = "Everforest-Dark-B";

  iconPackage = pkgs.everforest-gtk-theme;
  iconName = "Everforest-Dark";

  cursorTheme = "BreezeX-RosePine-Linux";
  cursorPackage = pkgs.rose-pine-cursor;
  cursorSize = 24;
in
{
  # Theme
  gtk = {
    enable = true;
    theme = {
      name = themeName;
      package = themePackage;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  # Icon
  gtk.iconTheme = {
    package = iconPackage;
    name = iconName;
  };

  # Prefer-dark
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  services.dunst.iconTheme = {
    package = iconPackage;
    name = iconName;
  };

  # Cursor
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    hyprcursor = {
      enable = true;
      size = cursorSize;
    };
    package = cursorPackage;
    name = cursorTheme;
    size = cursorSize;
  };
}
