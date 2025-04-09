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
  name = "lift";
  src = fetchFromGitHub {
    owner = "hraban";
    repo = "lift";
    rev = "a7941845a9de72be60e66ea941aa34cbee35bf23";
    hash = "sha256-3WCwYgXQJ4mHyZrTtiKq2Bwiue1HJ/O3zYjj6QyxI5Q=";
  };

  lispLibs = [
  ];

  lisps = [
    sbcl
  ];

  runner = sbcl;

  dontCheck = true;
}
