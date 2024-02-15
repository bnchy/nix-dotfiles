{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    image = pkgs.fetchurl {
      #url = "https://wallup.net/wp-content/uploads/2016/01/287035-SOMA-video_games-artwork.jpg";
      #url = "https://w.wallhaven.cc/full/1p/wallhaven-1poo61.jpg";
      url = "https://w.wallhaven.cc/full/rr/wallhaven-rr5p1j.png";
      hash = "sha256-yFM40mBoPa4SB9kde7zaBUtaQW5Kzh+lI0NiDwZ70GY=";
    };

    polarity = "dark";

    opacity = {
      desktop = 0.8;
      popups = 0.8;
      terminal = 0.8;
    };

    fonts = {
      serif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };

      sansSerif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };

      monospace = {
        name = "Fira Code";
        package = pkgs.fira-code;
      };

      sizes = {
        applications = 11;
        desktop = 11;
      };
    };

    targets = {
      vscode.enable = false;
    };
  };
}
