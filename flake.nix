{
  description = "Development environment template";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      with pkgs;
      {
        devShell = mkShell rec {
          nativeBuildInputs = [
            typescript
            tailwindcss_4

            nodePackages.typescript-language-server
            astro-language-server
            tailwindcss-language-server
          ];
          buildInputs = [
            nodePackages_latest.nodejs
          ];
          LD_LIBRARY_PATH = lib.makeLibraryPath buildInputs;
        };
      }
    );
}

