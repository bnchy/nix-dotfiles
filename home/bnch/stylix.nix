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
      url = "https://w.wallhaven.cc/full/rr/wallhaven-rr5p1j.png";
      hash = "sha256-yFM40mBoPa4SB9kde7zaBUtaQW5Kzh+lI0NiDwZ70GY=";
    };

    polarity = "dark";

    opacity = {
      desktop = 0.8;
      popups = 0.8;
      terminal = 0.8;
    };

    fonts = let
      luna-fonts = inputs.nix-dotfiles.packages.${pkgs.system};
    in
      with luna-fonts; {
        serif = {
          name = "EB Garamond";
          package = pkgs.eb-garamond;
        };

        sansSerif = {
          name = "Geist";
          package = geist;
        };

        monospace = {
          name = "GeistMono NFM";
          package = geist-nf;
        };

        emoji = {
          name = "Twitter Color Emoji";
          package = pkgs.twitter-color-emoji;
        };
      };

    cursor = {
      name = "capitaine-cursors";
      package = pkgs.capitaine-cursors;
    };

    targets = {
      vscode.enable = false;
    };
  };

  gtk.iconTheme = {
    name = "Papirus";
    package = pkgs.papirus-icon-theme;
  };

  home.packages = [pkgs.noto-fonts-cjk-sans];
}
