{ config, pkgs, ... }:

with pkgs.lib;

let

  cfg = config.services.wayland;

in

{
  ###### interface

  options = {

    services.wayland.enable = mkOption {
      default = false;
      description = ''
        Whether to enable Wayland.
      '';
    };

  };


  ###### implementation

  config = mkIf cfg.enable {

    environment.systemPackages = [ pkgs.weston ];

    security.setuidPrograms = [ "weston-launch" ];

  };

}
