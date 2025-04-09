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
  fiveam = lispDerivation {
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

    runner = sbcl;
  };

  asdf-flv = fetchFromGitHub {
    owner = "didierverna";
    repo = "asdf-flv";
    rev = "3f1de416f7f40a39c47f08335c710a884ece36b3";
    hash = "sha256-XKMv04SNF7brzLReTSe9GJBaLJITDYUPyF41TRuUbOs=";
  };

  trivial-backtrace = fetchFromGitHub {
    owner = "hraban";
    repo = "trivial-backtrace";
    rev = "7f90b4a4144775cca0728791e4b92ac2557b07a1";
    hash = "sha256-dg5xWOdR1NuRjgJq6KBwbrNxS2ZKH94JwsXa+va4QIY=";
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

  lispLibs = [
    fiveam
  ];

  lisps = [
    sbcl
  ];

  runner = sbcl;
}
