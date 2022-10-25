{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... } @ inputs:
    utils.lib.eachDefaultSystem (system:
      let
        project-name = "main";

        pkgs = import nixpkgs { inherit system; };
        deps = [ ];
        native-deps = with pkgs; [
          maven
          openjdk17_headless
        ];
        dev-deps = with pkgs; [
          rnix-lsp
          jdt-language-server
        ];
      in
      {
        devShell = pkgs.stdenvNoCC.mkDerivation {
          name = "shell";
          nativeBuildInputs = deps ++ native-deps ++ dev-deps;
        };
      });
}
