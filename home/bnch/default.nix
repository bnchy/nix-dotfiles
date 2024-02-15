{pkgs, ...}: {
  imports = [
    ./applications/vscode.nix
    ./applications/intellij.nix
    ./applications/git.nix
    ./applications/discord.nix

    ./cli/direnv.nix

    ./stylix.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };
  
  programs.alacritty.enable = true;

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
}
