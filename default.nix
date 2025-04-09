{
  lib,
  callPackage,
  fetchFromGitHub,
  fetchFromGitLab,
  lispDerivation ? callPackage ./nix/lispDerivation { },

  sbcl,
  clisp,
  ecl,
}:

let
  fiveam = callPackage ./nix/fiveam { };
in

lispDerivation {
  pname = "hello-commonlisp";
  version = "dev";
  src = lib.cleanSource ./.;

  lispLibs = [
    fiveam
  ];

  lisps = [
    sbcl
  ];

  runner = sbcl;
}
