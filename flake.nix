{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        nativeBuildInputs = with pkgs; [ lua luarocks stylua lua-language-server ];
        # buildInputs = with pkgs; [ libpq ];
      in with pkgs; {
        devShells.default = mkShell { inherit nativeBuildInputs; };
      });
}
