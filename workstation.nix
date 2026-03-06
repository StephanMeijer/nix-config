{ config, lib, ... }:

let
  mod = config.xsession.windowManager.i3.config.modifier;
in
{
  # Clipboard manager (clipmenud systemd user service)
  services.clipmenu.enable = true;

  home.sessionVariables = {
    CM_LAUNCHER = "rofi";
  };

  # Rofi launcher
  programs.rofi = {
    enable = true;
  };

  # i3 window manager
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      keybindings = lib.mkOptionDefault {
        "${mod}+c" = "exec --no-startup-id clipmenu";
      };
    };
  };
}
