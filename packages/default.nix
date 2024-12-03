{ pkgs ? import <nixpkgs> {} }:

let
  anchor = pkgs.callPackage ./anchor.nix { inherit pkgs; };
in
with pkgs; [  
  alacritty
  tmux
  chromium
  discord
  git
  stow
  zoxide
  starship
  zed-editor
  anchor
]
