# Replace "stdenv" with the namespace or name of your language's builder
{lib, stdenv, pstree, ps, makeWrapper}:
# Replace "stdenv.mkDerivation" with your language's builder
stdenv.mkDerivation {
  pname = "ptree";
  version = "0.0.1";
  src = ../.;

  installPhase = ''
    export PREFIX="$out"
    make install
  '';

  postFixup = ''
    wrapProgram $out/bin/ptree \
    --set PATH ${lib.makeBinPath [
     pstree
     ps
    ]}
  '';

  # Add any dependencies your software needs at runtime to propagatedBuildInputs
  propagatedBuildInputs = [];

  # Add any dependencies your software only needs at buildtime to buildInputs
  buildInputs = [makeWrapper];
}
