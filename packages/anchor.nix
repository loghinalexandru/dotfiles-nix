{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "anchor";
  version = "0.2.1";

  src = pkgs.fetchzip {
    url = "https://github.com/loghinalexandru/anchor/releases/download/v0.2.1/anchorv0.2.1_linux-amd64.tar.gz";
    hash = "sha256-Q7CVpiW1B0LWnkj4jyV0+ygxesLB3wcqEXs9Za9dh7c=";
    stripRoot = false;
  };
  
  nativeBuildInputs = with pkgs; [ autoPatchelfHook ];

  buildInput = with pkgs; [ glibc ];

  installPhase = ''
    runHook preInstall

    install -Dm755 ./anchor -t $out/bin

    runHook postInstall
  '';
}
