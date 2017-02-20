{ bootFetchgit ? (import <nixpkgs> {}).fetchgit, compiler ? "ghc802" }:
let
  pkgs = import (bootFetchgit (import ./version.nix)) {};
  cabalPkg = pkgs.haskell.packages.${compiler}.callPackage ./tlscheck.nix {};
  #extDeps = with pkgs; [
  #  rt
  #  zlib
  #  gmp
  #  pth
  #  dl
  #];
in cabalPkg // {
  #enableSharedExecutables = false;
  #enableSharedLibraries = false;
  #enableStaticLibraries = true;
  #addBuildDepends = extDeps;
}
