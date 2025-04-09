{
  lib,
  callPackage,
  fetchFromGitHub,
  lispDerivation ? callPackage ../lispDerivation { },

  sbcl,
  clisp,
  ecl,
}:

lispDerivation {
  name = "net.didierverna.asdf-flv";
  src = fetchFromGitHub {
    owner = "didierverna";
    repo = "asdf-flv";
    rev = "3f1de416f7f40a39c47f08335c710a884ece36b3";
    hash = "sha256-XKMv04SNF7brzLReTSe9GJBaLJITDYUPyF41TRuUbOs=";
  };

  lisps = [
    sbcl
  ];

  runner = sbcl;
}
