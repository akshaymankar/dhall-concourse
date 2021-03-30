{ stdenv, fetchurl }:
stdenv.mkDerivation rec {
  pname = "fly";
  version = "7.1.0";

  src = fetchurl {
    url = "https://github.com/concourse/concourse/releases/download/v${version}/fly-${version}-linux-amd64.tgz";
    sha256 = "0fksa96msky2ih9mary2w5zc7lh005j1rvyycwf51lk0pnph41af";
  };

  unpackPhase = ''
    mkdir -p $out/bin
    tar xf $src -C $out/bin
  '';

  dontInstall = true;
}
