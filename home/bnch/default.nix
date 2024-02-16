{
  pkgs,
  outputs,
  ...
}: {
  imports =
    [
      ./applications/vscode.nix
      ./applications/intellij.nix
      ./applications/git.nix
      ./applications/discord.nix

      ./cli/direnv.nix

      ./desktop/hyprland

      ./stylix.nix
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  programs.helix.enable = true;

  home = {
    packages = with pkgs; [
      firefox
      slack
      spotify
      nodejs
      libreoffice-qt
      hunspell
      hunspellDicts.nl_NL
      neofetch
    ];

    stateVersion = "23.11";
  };

  monitors = [
    {
      name = "eDP-1";
      width = 3840;
      height = 2160;
      x = 760;
      y = 1440;
      scale = 2.0;
    }
    {
      name = "DP-1";
      width = 3440;
      height = 1440;
    }
  ];
}
