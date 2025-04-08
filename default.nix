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
  fiveam = fetchFromGitHub {
    owner = "lispci";
    repo = "fiveam";
    rev = "e43d6c8e7da5a80d5c33e8ca018fb1619c5b0293";
    hash = "sha256-0C4Mj5ulfnmvsG6d5cJmCcrDFw8heQHMgv8piKWryhg=";
  };

  alexandria = fetchFromGitLab {
    domain = "gitlab.common-lisp.net";
    repo = "alexandria";
    owner = "alexandria";
    rev = "8514d8e68ed0c733abf7f96f9e91b24912686dc4";
    hash = "sha256-vPHp/dXX24zUPF1t7EdBryzqlG33A0fOoD5loFOxAEs=";
  };
in

lispDerivation {
  pname = "hello-commonlisp";
  version = "dev";
  src = lib.cleanSource ./.;

  buildInputs = [
    fiveam
  ];

  lispImpls = [
    sbcl
    clisp
    ecl
  ];
}
