{ pkgs ? import <nixpkgs> {} }:

let
  zed-mono-fonts = pkgs.callPackage ./zed-mono-fonts.nix { inherit pkgs; };
in
with pkgs; [
  zed-mono-fonts
]
