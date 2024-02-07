{pkgs, ...}: {
  imports = [
    ./applications/vscode.nix
    ./applications/intellij.nix
    ./applications/git.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home = {
    packages = with pkgs; [firefox];
    stateVersion = "23.11";
  };
}
