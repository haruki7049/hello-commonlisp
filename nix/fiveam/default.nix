{
  lib,
  callPackage,
  fetchFromGitHub,
  fetchFromGitLab,
  lispDerivation ? callPackage ../lispDerivation { },

  sbcl,
  clisp,
  ecl,
}:

let
  trivial-backtrace = callPackage ../trivial-backtrace { };
  asdf-flv = callPackage ../asdf-flv { };
  alexandria = callPackage ../alexandria { };
in

lispDerivation {
  name = "fiveam";
  src = fetchFromGitHub {
    owner = "lispci";
    repo = "fiveam";
    rev = "e43d6c8e7da5a80d5c33e8ca018fb1619c5b0293";
    hash = "sha256-0C4Mj5ulfnmvsG6d5cJmCcrDFw8heQHMgv8piKWryhg=";
  };

  lispLibs = [
    alexandria
    asdf-flv
    trivial-backtrace
  ];

  lisps = [
    sbcl
    clisp
    ecl
  ];

  doCheck = true;

  runner = sbcl;
}
