{
  lib,
  callPackage,
  fetchFromGitHub,
  lispDerivation ? callPackage ../lispDerivation { },

  sbcl,
  clisp,
  ecl,
}:

let
  lift = callPackage ../lift { };
in

lispDerivation {
  name = "trivial-backtrace";
  src = fetchFromGitHub {
    owner = "hraban";
    repo = "trivial-backtrace";
    rev = "7f90b4a4144775cca0728791e4b92ac2557b07a1";
    hash = "sha256-dg5xWOdR1NuRjgJq6KBwbrNxS2ZKH94JwsXa+va4QIY=";
  };

  lisps = [
    sbcl
    clisp
    ecl
  ];

  runner = sbcl;

  dontCheck = true;
}
