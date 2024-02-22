{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      font = config.stylix.fonts.sansSerif.name;
      fade-in = 0.5;
      screenshots = true;
      clock = true;
      show-failed-attempts = true;
      indicator-idle-visible = true;
      effect-blur = "5x8";
    };
  };

  services.swayidle = {
    enable = false;

    events = [
      {
        event = "before-sleep";
        command = "${config.programs.swaylock.package}/bin/swaylock";
      }
    ];

    timeouts = [
      {
        timeout = 60 * 2;
        command = "${config.programs.swaylock.package}/bin/swaylock";
      }
    ];
  };
}
