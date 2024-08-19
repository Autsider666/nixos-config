{ config, pkgs, ... }:

{
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.compact-top-bar
    gnomeExtensions.gtile
    gnomeExtensions.dash-to-panel
    gnomeExtensions.arcmenu
    gnomeExtensions.just-perfection
    gnomeExtensions.appindicator
    gnomeExtensions.tactile
    gnomeExtensions.tiling-assistant
    gnomeExtensions.quick-settings-tweaker
    gnomeExtensions.ddterm
    gnomeExtensions.logo-menu
    gnomeExtensions.top-bar-organizer
  ];

  programs = {
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
  };
}