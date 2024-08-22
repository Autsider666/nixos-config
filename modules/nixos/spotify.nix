{ config, pkgs, ... }:
# https://nixos.wiki/wiki/Spotify
{
   environment.systemPackages = with pkgs; [
     spotify
   ];

   networking.firewall = {
     allowedTCPPorts = [ 57621 ];
     allowedUDPPorts = [ 5353 ];
   };
}