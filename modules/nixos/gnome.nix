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

  environment.systemPackages = (with pkgs; [
    endeavour # Task manager
    gnome-solanum # Pomodoro
  ]) ++ (with pkgs.gnomeExtensions; [
    compact-top-bar
    dash-to-panel
    arcmenu
    just-perfection
    appindicator
    tactile
    tiling-assistant
    quick-settings-tweaker
    ddterm
    logo-menu
    ]);

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gedit # text editor
    # totem # video player
    gnome-text-editor
    cheese # webcam tool
    epiphany # web browser
    geary # email reader
    evince # document viewer
    simple-scan
    gnome-music
    gnome-characters
    gnome-weather
    gnome-contacts
    gnome-maps
  ]);

  programs = {
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
  };
}