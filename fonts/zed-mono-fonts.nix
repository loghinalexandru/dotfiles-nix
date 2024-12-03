{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "zed-fonts";
  version = "1.2.0";
  src =  pkgs.fetchurl {
    url = "https://github.com/zed-industries/zed-fonts/releases/download/1.2.0/zed-mono-1.2.0.zip";
    hash = "sha256-62c7OVKJJ9IcCxLq8F5QurxIa8mecktVyI5Sml2udsk=";
  };

  unpackPhase = ''
    runHook preUnpack

    ${pkgs.unzip}/bin/unzip $src

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    install -Dm644 *.ttf -t $out/share/fonts/zed-mono

    runHook postInstall
  '';
}
