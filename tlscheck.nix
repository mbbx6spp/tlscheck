{ mkDerivation, base, optparse-applicative, stdenv, tls }:
mkDerivation {
  pname = "tlscheck";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base optparse-applicative tls ];
  description = "A `test` like CLI for testing TLS connections, negotions, etc";
  license = stdenv.lib.licenses.bsd3;
}
